# Recyclable-Scroll-Rect
 
 ## Summary

 Using the default scroll-rect to create lists with huge number of items results in a laggy performance.  Specially when creating a list with hundreds or thousands of elements it becomes impossible to use the scroll rect with the default approach i.e instantiating that many items. Recyclable scroll rect  reuses or recycles the least no of cells required to fill the viewport. As a result any number of items can be shown in the list without any performance hit. Currently only vertical single item list is supported. 
 RoadMap (based on feedback):
 1. Horizontal list
 2. Gird view
 3. Content size fitting.


## Quick start Guide :

 Check the demo scene. 
 The usage is similar to iOS tableViewController. The recyclable Scroll rect must be assigned a datasource. A datasource is responsible for telling the scroll rect the list size and setting data to a cell.


 1. Creating a prototype cell
 3. Extending the controller class with datasource
 4. implementing the datasource methods.



 Creating a prototype cell
 As the name says, a prototype cell is the cell like which all the cells in the scrollrect will look like. A prototype cell can be in the heirarchy as a content child or can be a prefab. Don’t worry about disabling it If present the heirarchy, it will not show up in the final list. it must be assigned to the recyclable scroll rect.

 Once you create a your desired prototype cell , assign it to the scroll rect component. Now you will need to create a Cell script. this script must inherit from ICell. You must keep reference to the UI items that are required to be set according to your data source.

 Check DemoCell class in the project


 1. Extending the controller class with datasource

 The next step is to assign a datasource to scrollrect. 
 What does a datasource do?
 it tells the no of items in the list

 you can extend your class with datasource and implement the noofitems and  setItemData functions.

 Check scroll controller class in the project. 
