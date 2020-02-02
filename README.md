# Recyclable Scroll Rect
 
 ## Summary

 Using the default scroll-rect to create lists with huge number of items results in a laggy performance.  Specially when creating a list with hundreds or thousands of elements it becomes impossible to use the scroll rect with the default approach i.e instantiating that many items. Recyclable scroll rect  reuses or recycles the least no of cells required to fill the viewport. As a result any number of items can be shown in the list without any performance hit. Currently only vertical single item list is supported. 
 RoadMap (based on feedback):
 1. Horizontal list
 2. Gird view
 3. Content size fitting.




| Recycling  | Comparison with Default approach |
| ------------- | ------------- |
| ![Imgur Image](https://imgur.com/8LaILL7.gif)  | ![Imgur Image](https://imgur.com/pm9AmBH.gif) |

## Quick start Guide :

 <b>Check the Demo scene for a complete example </b> <br><br>
 The usage and struture  is similar to Native iOS <i>TableViewController</i>. To summarize there are two main steps. One is to create a prototype cell and the other is to set a DataSource. A prototype cell is basically the cell's layout in the list and a Datasource is responsible for providing the List the list size and the configuration of cells as the list updates/recycles. Following are the steps to set up a <i>Recyclable Scroll Rect</i> :
 
1. Recyclable Scroll View
2. Prototype cell
3. Cell class
4. Datasource
5. Bindings


<b>1. Recyclable Scroll View</b> : You can create a <i>Recyclable Scroll View</i> by going to <i>Create -> UI -> Recyclable Scroll View</i> .

<b>2. Prototype cell</b>  :  As the name says, a Prototype cell is basically the cell layout for your list. A prototype cell can be in the heirarchy as the content's child or it can be a prefab. Don’t worry about disabling it If present in the heirarchy, it will not show up in play mode. The prototype cell must be assigned to the <i>Recyclable Scroll Rect</i>. When you create a <i>Recyclable Scroll View</i> from menu, a prototype cell will already be present in the content. You can delete it to create your own or modify it according to your requirements.

<b>3. Cell class</b>  :  Once you create your desired Prototype cell, assign it to the <i>Recyclable Scroll Rect</i> component. Now you will need to create a <i>Cell</i> script and add it to the Prototype Cell. This script must be a <i>Monobehaviour</i> inheriting from <i>ICell</i>. The purpose of a Cell script is to confugure the cell as the list is scrolled or updated. You must keep reference to the UI items that are required to be updated according to your data source.
<b>Check <i>DemoCell</i> class for reference</b>

<b> 3. Datasource</b>  : The next step is to create a Datasource class. A Datasource is responsible for data related operations in the Recyclable scroll rect. These are the no of items in the list and how a cell should be configured according to the data. To create a Data source, extend your class with <i>IRecyclableScrollRectDataSource</i> and implement the GetItemCount and  SetCell Methods. <br>
    <b>• GetItemCount</b>  : This method is basically to tell the Recyclable ScrollRect  the length of the List.  <br>
    <b>• SetCell </b>: This method is responsible for configuring the cell UI according to your data. A cell is received as a parameter from which necessary UI configuration can be done. The recieved cell is of ICell type. Cast it to the inherited Cell type before using. 
<b>Check <i>RecyclableScrollRectDemo</i> class for reference</b>
 
<b>  4. Bindings</b>  : Once you are done with the creation of <i>Cell</i> and <i>Datasource</i>, the last step is to assign the datasource instance to the Recyclable Scroll Rect. The assignmnent must be done in <i>Awake</i> or before  Recyclable Scroll Rect's start. <b>Check <i>Awake</i> method in <i>RecyclableScrollRectDemo</i> class. </b>
 
 
 <b> Others:</b> <br>
 <b>Self Initiaze</b> : The <i>Recyclable Scroll Rect</i> initializes on its own in it's <i>Start</i> method. If you wish to initialize it yourself you can turn off component's <i>self initialize</i> property and call the <i>Initialize</i> method whenever required.

