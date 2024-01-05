//
//  ThreadLocal.swift
//  MyObservation
//
//  Created by Wei Wang on 2023/08/03.
//

public enum _ThreadLocal {
    public static var value: UnsafeMutableRawPointer? {
        get {
            _tlsGet()
        }
        set {
            _tlsSet(newValue)
        }
    }
}

@_silgen_name("_swift_observation_tls_get")
func _tlsGet() -> UnsafeMutableRawPointer?

@_silgen_name("_swift_observation_tls_set")
func _tlsSet(_ value: UnsafeMutableRawPointer?)
