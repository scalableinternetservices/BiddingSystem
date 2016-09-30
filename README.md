# Bidding System

The system is conceptualized to be an online bidding system where sellers can place bid on items and set a date and time when the bid ends. The customers, on the flip side, can register to the site and participate in one or more bids. As the bid ends, the system will announce the highest bidder. 

The system may suffer from scalability issues with respect to one or more of the functionalities listed below:

1. Searching for items that matches certain criteria. As the sellers keep on adding items, the database grows large. Returning the list of matching items in a reasonable amount of time poses a challenge. The filters can be applied in conjunction with each other to constrain the search.

   * *By category*: A bidder is allowed to search for items in particular category, e.g. camera, laptop etc. It is a mandatory field.
   * *By bid limit*: A bidder is allowed to search for items having highest bid amount less than `$X` to purchase an item in category `Y`.
   * *By age*: A bidder is allowed to search for items not older than a certain date.
   
2. Showing the highest bid in real time. As soon as a bid is placed on any item, the site should reflect the same in (near) real time. With many bids going on in parallel and with several users trying to place bids on the same items, it'd an interesting aspect to scale which is essential for a practical bidding service.

3. Updating the list of sold items and items for sale in real time. As soon as a new items is added by the seller for sale or any item gets sold, the site should reflect the same in (near) real time. With many bids going on in parallel and with several users trying to place bids on the same items, it'd an interesting aspect to scale which is essential for a practical bidding service.
 
---

# Brains Behind
Awesome or aweful, whatever be the service is, we take pride in saying that this is *our* brain-child.

<table width=5>
    <tr>
        <td><center><img src="https://s18.postimg.org/7r1f2wfl5/our_ninja.png">
        <br>Priyanka Bose</center></td>
        <td><center><img src="https://s18.postimg.org/7r1f2wfl5/our_ninja.png">
        <br>Sanjana Sahayaraj</center></td>
    </tr>
    <tr>
        <td><center><img src="https://s18.postimg.org/7r1f2wfl5/our_ninja.png">
        <br>Seemanta Saha</center></td>
        <td><center><img src="https://s18.postimg.org/7r1f2wfl5/our_ninja.png">
        <br>Dipanjan Das</center></td>
    </tr>
</table>