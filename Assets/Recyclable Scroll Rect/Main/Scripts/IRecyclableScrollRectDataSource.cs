//MIT License
//Copyright (c) 2020 Mohammed Iqubal Hussain
//Website : Polyandcode.com 

/// <summary>
/// Interface for creating DataSource
/// Recyclable Scroll Rect must be provided a Data source which must inherit from this.
/// </summary>
namespace PolyAndCode.UI
{
    public interface IRecyclableScrollRectDataSource
    {
        int GetItemCount();
        void SetCell(ICell cell, int index);
    }
}
