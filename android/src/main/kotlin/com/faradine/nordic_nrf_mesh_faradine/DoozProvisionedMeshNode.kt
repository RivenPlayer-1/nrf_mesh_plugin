package com.faradine.nordic_nrf_mesh_faradine

import android.annotation.SuppressLint
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import no.nordicsemi.android.mesh.models.SceneServer
import no.nordicsemi.android.mesh.transport.ProvisionedMeshNode

class DoozProvisionedMeshNode(binaryMessenger: BinaryMessenger, var meshNode: ProvisionedMeshNode): MethodChannel.MethodCallHandler {
    init {
        MethodChannel(binaryMessenger, "$namespace/provisioned_mesh_node/${meshNode.uuid}/methods").setMethodCallHandler(this)
    }

    @SuppressLint("RestrictedApi")
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "nodeName" -> {
                val nodeName = call.argument<String>("name")!!
                meshNode.nodeName = nodeName
                result.success(null)
            }
            "name" -> {
                result.success(meshNode.nodeName)
            }
            "elementAt" -> {

            }
            "elements" -> {
                result.success(meshNode.elements.map { element ->
                    mapOf(
                        "key" to element.key,
                        "address" to element.value.elementAddress,
                        "name" to element.value.name,
                        "locationDescriptor" to element.value.locationDescriptor,
                        "models" to element.value.meshModels.map {
                            mapOf(
                                "key" to it.key,
                                "modelId" to it.value.modelId,
                                "subscribedAddresses" to it.value.subscribedAddresses,
                                "boundAppKey" to it.value.boundAppKeyIndexes,
                                "modelName" to it.value.modelName,
                                "subscriptionAddresses" to it.value.subscribedAddresses,
                                "sceneNumbers" to if (it.value is SceneServer) (it.value as SceneServer).scenesNumbers else null
                            )
                        }
                    )
                })
            }
            "unicastAddress" -> {
                result.success(meshNode.unicastAddress)
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}