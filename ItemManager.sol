pragma solidity ^0.6.0; 
 
contract ItemManager{ 
        
     struct S_Item {   
     Item_item;     
     ItemManager.SupplyChainSteps _step;  
     string _identifier;
     uint _priceInWei;    
     }
     mapping(uint => S_Item) public items;  
     uint index;      

     enum SupplyChainSteps{Created, Paid, Delivered}

     event SupplyChainStep(uint _itemIndex, uint _step, address_address);    

     function createItem(string memory _identifier, uint _priceInWei) public {  
     item item = new Item(this, _priceInWei, index);
     items[index]._item= item;
     items[index]._step = SupplyChainSteps.Created;     
     items[index]._identifier = _identifier;
     emit SupplyChainStep(index, uint(items[index]._step)); 
     index++;     }         


    function triggerPayment(uint _index) public payable {       
    Item item = items[_index].item;
    require(address[item]==msg.sender, "Only items are allowed to update themselves"
    require(items[index]._step == SupplyChainSteps.Created, "Item is further in the supply chain"); 
    items[_index]._step = SupplyChainSteps.Paid;  
    emit SupplyChainStep(_index, uint(items[_index]._step)), address(item));  
    }

   function triggerDelivery(uint _index) public {     
   require(items[_index]._step == SupplyChainSteps.Paid, "Item is further in the supp ly chain");  
   items[_index]._step = SupplyChainSteps.Delivered;       
    emit SupplyChainStep(_index, uint(items[_index]._step), address(items[_index]._item));
    }
 }