using UnityEngine;
using UnityEngine.UI;
using PolyAndCode.UI;

//Cell class for demo. A cell in Recyclable Scroll Rect must have a cell class inheriting from ICell.
//The class must have reference to UI elements required to be configured
// The configuration of a cell is done via the SetCellData method in controller class( one inheriting the IDataSource)
//Check RecyclableScrollerDemo
public class DemoCell : MonoBehaviour, ICell
{
    public Text nameLabel;
    public Text genderLabel;
    public Text idLabel;
}
