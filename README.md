HW_3
====

Допилите таск менеджер. Пример работы законченного варианта:
<img src="https://raw.github.com/Sk0rpion/HW_3/master/example.gif" alt="Demo" width="320" height="480" />

## Hint
Для функции удаления из таблицы необходимо определить 2 метода.
```objective-c
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // указываем какие строчки редактируемы
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //удаляем строчку из данных, обновляем таблицу
    }
}
```
