
<!-- Notes.md Q1 first draft table -->
<table>
<thead>
  <tr>
    <th><i>Scope</i></th> <th><i>Attribute</i></th> <th><i>Store Loc</i></th> 
    <th><i>Host Vis</i></th> <th><i>Device Vis</i></th>
    <th>When</th>
    <th>C/C++/HIP</th>
    <th>LLVM IR</th> 
  </tr>
</thead>
<tr>
  <td>global </td><td> <code>__managed__</code> </td><td> <i>UNKNOWN</i> </td>
  <td>✔</td> <td>✔</td>
<td>

...Some **md**...
</td><td>

```cpp
__managed__ size_t __g_val__ = 0xFAD; 
```
</td><td>

```llvm
  %5 = call @__g_val__
```
</td></tr>
<tr> 
  <td>global </td><td> <code>__managed__</code> </td><td> <i>UNKNOWN</i>
  <td>✔</td> <td>✔</td>
</td><td>

...Some **md**...
</td><td>

```cpp
__managed__ size_t __g_val__ = 0xFAD; 
```
</td><td>

```llvm
  %5 = call @__g_val__
```
</td>
</tr>
</table>