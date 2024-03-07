# capacitor-cpu-monitoring

Capacitor CPU monitoring plugin

## Install

```bash
npm install capacitor-cpu-monitoring
npx cap sync
```

## API

<docgen-index>

* [`addListener(string, ...)`](#addlistenerstring)
* [`getLoad()`](#getload)
* [`setLoadRefreshTime(...)`](#setloadrefreshtime)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### addListener(string, ...)

```typescript
addListener(eventName: string, listenerFunc: (...args: any) => void) => Promise<PluginListenerHandle> & PluginListenerHandle
```

| Param              | Type                                   |
| ------------------ | -------------------------------------- |
| **`eventName`**    | <code>string</code>                    |
| **`listenerFunc`** | <code>(...args: any) =&gt; void</code> |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt; & <a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

--------------------


### getLoad()

```typescript
getLoad() => Promise<CPULoadState>
```

**Returns:** <code>Promise&lt;<a href="#cpuloadstate">CPULoadState</a>&gt;</code>

--------------------


### setLoadRefreshTime(...)

```typescript
setLoadRefreshTime(options: { interval: number; }) => void
```

| Param         | Type                               |
| ------------- | ---------------------------------- |
| **`options`** | <code>{ interval: number; }</code> |

--------------------


### Interfaces


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |


#### CPULoadState

| Prop       | Type                |
| ---------- | ------------------- |
| **`load`** | <code>number</code> |

</docgen-api>
