package com.aquent.crudapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.service.ClientService;
import com.aquent.crudapp.service.PersonService;

/**
 * Controller for handling basic client management operations.
 */
@Controller
@RequestMapping("client")
public class ClientController {

    public static final String COMMAND_DELETE = "Delete";
    
    public static final String COMMAND_CANCEL = "Cancel";

    @Inject private ClientService clientService;
    
    @Inject private PersonService personService;
    
    /**
     * Renders the listing page.
     *
     * @return list view populated with the current list of clients
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("client/list");
        mav.addObject("clients", clientService.list());
        return mav;
    }

    /**
     * Renders an empty form used to create a new client record.
     *
     * @return create view populated with an empty client
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView("client/create");
        mav.addObject("client", new Client());
        mav.addObject("errors", new ArrayList<String>());
        return mav;
    }

    /**
     * Validates and saves a new client.
     * On success, the user is redirected to the listing page.
     * On failure, the form is redisplayed with the validation errors.
     *
     * @param client populated form bean for the client
     * @return redirect, or create view with errors
     */
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public ModelAndView create(Client client, @RequestParam String command) {
    	if(COMMAND_CANCEL.equals(command)){
    		return new ModelAndView("redirect:/client/list");
    	}else{
    		List<String> errors = clientService.validateClient(client);
    		if (errors.isEmpty()) {
    			clientService.createClient(client);
    			return new ModelAndView("redirect:/client/list");
    		} else {
    			ModelAndView mav = new ModelAndView("client/create");
    			mav.addObject("client", client);
    			mav.addObject("errors", errors);
    			return mav;
    		}
    	}
    }

    /**
     * Renders an edit form for an existing client record.
     *
     * @param clientId the ID of the client to edit
     * @return edit view populated from the client record
     */
    @RequestMapping(value = "edit/{clientId}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable Integer clientId) {
        ModelAndView mav = new ModelAndView("client/edit");
        Client client = clientService.readClient(clientId);
        if(null == client){
        	return new ModelAndView("client/error");
        }
        mav.addObject("client", client);
        mav.addObject("people",personService.findAvailablePeople());
        mav.addObject("errors", new ArrayList<String>());
        return mav;
    }

    
    /**
     * Renders a read only view of the client record
     * @param clientId of the client to view
     * @return view of the client record
     */
    @RequestMapping(value = "view/{clientId}", method = RequestMethod.GET)
    public ModelAndView view(@PathVariable Integer clientId) {
        ModelAndView mav = new ModelAndView("client/view");
        Client client = clientService.readClient(clientId);
        if(null == client){
        	return new ModelAndView("client/error");
        }
        mav.addObject("client", client);
        return mav;
    }
    
    /**
     * Validates and saves an edited client along with any added/removed contacts
     * On success, the user is redirected to the listing page.
     * On failure, the form is redisplayed with the validation errors.
     *
     * @param client populated form bean for the client, 
     * @param addIds - an array of personIds to add as contacts
     * @param removeIds - an array of personIds to remove as contacts
     * @return redirect, or edit view with errors
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
	public ModelAndView edit(Client client, @RequestParam String command,
			@RequestParam(required = false, value = "addIds") Integer[] addIds,
			@RequestParam(required = false, value = "removeIds") Integer[] removeIds) {
		if (COMMAND_CANCEL.equals(command)) {
			return new ModelAndView("redirect:/client/list");
		} else {
			List<String> errors = clientService.validateClient(client);
			if (errors.isEmpty()) {
				clientService.updateClient(client);
				if (null != addIds) {
					for (Integer personId : addIds) {
						personService.addClient(personId, client.getClientId());
					}
				}
				if (null != removeIds) {
					for (Integer personId : removeIds) {
						personService.removeClient(personId);
					}
				}

				return new ModelAndView("redirect:/client/list");
			} else {
				ModelAndView mav = new ModelAndView("client/edit");
				mav.addObject("client", client);
				mav.addObject("errors", errors);
				return mav;
			}
		}
	}

    /**
     * addes person objects as contacts to the client
     * @param clientId - id of the client 
     * @param ids - array of personIds to add as contacts
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ModelAndView add(@RequestParam Integer clientId, @RequestParam(required=false, value="ids") Integer[] ids) {
    	if(null != ids){
    		for(Integer personId:ids){
    			personService.addClient(personId,clientId);
    		}
    	}
    	return new ModelAndView("redirect:/client/edit/" + clientId);
    }
    
    @RequestMapping(value = "remove", method = RequestMethod.POST)
    public ModelAndView remove(@RequestParam Integer clientId, @RequestParam(required=false, value="ids") Integer[] ids) {
    	if(null != ids){
    		for(Integer personId:ids){
    			personService.removeClient(personId);
    		}
    	}
    	return new ModelAndView("redirect:/client/edit/" + clientId);
    }
    
    
    /**
     * Renders the deletion confirmation page.
     *
     * @param clientId the ID of the client to be deleted
     * @return delete view populated from the client record
     */
    @RequestMapping(value = "delete/{clientId}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Integer clientId) {
        ModelAndView mav = new ModelAndView("client/delete");
        mav.addObject("client", clientService.readClient(clientId));
        return mav;
    }

    /**
     * Handles client deletion or cancellation, redirecting to the listing page in either case.
     *
     * @param command the command field from the form
     * @param clientId the ID of the client to be deleted
     * @return redirect to the listing page
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(@RequestParam String command, @RequestParam Integer clientId) {
        if (COMMAND_DELETE.equals(command)) {
            clientService.deleteClient(clientId);
        }
        return "redirect:/client/list";
    }
}
