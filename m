Received: from mail.barrensea.org (mail.barrensea.org [198.12.121.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65853B813E;
	Tue, 12 May 2026 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.12.121.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778601524; cv=none; b=lpc342fGsgnwvbSaYtc1+cT89+tdTs5P3XJwZV3/fTBCBQR4qC+31flSImJvNsdV+EGXYiibs/DPCbEKd9dHPGXUWfGjJmm47UuS11tFleI6lryvKmzbu8fdDbgtMxoVEMT3hvivHdoc0j5LAdAwf411qXNne+7F4sGjdwiIzfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778601524; c=relaxed/simple;
	bh=LyVevI4iq2pqbF82MP/74G9GBCLiZ00V0jsayugsU9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U+QM7jAibq+oeBQ1nxKgp0WCNs5dhxsqADeX6+8ICXjCBXLcERcx1PkxZZjnayfrTP3VNOtxuqMYoeeNYeWSgbwa4ulm4B78e5zej3zbyoir+rzbiENXozIMhjP54hT1u/oZBwgDAuT0MIGkQuotrXnHWIn9HK5/4M522COI/8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org; spf=pass smtp.mailfrom=barrensea.org; dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b=BK/BmsIZ; arc=none smtp.client-ip=198.12.121.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barrensea.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b="BK/BmsIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=barrensea.org;
	s=mail; t=1778601517;
	bh=LyVevI4iq2pqbF82MP/74G9GBCLiZ00V0jsayugsU9s=;
	h=From:To:Cc:Subject;
	b=BK/BmsIZnXpfBR+zaj4IjqF9401nET42739/7aYHyeXKGhUX8u2169wfo9at24b3j
	 +g3SEmSfZpBhXY4faEXpgDC9WoFaFTSrNXS1IgAi1oCPtSyiW2wKKumogfN8IsrHjN
	 i7cbj6b9yL8dE5LXUV2Wx/ejz8mlJiCL+HfDM810zaPjumFPbOgSPMu56ih+uI/0ZR
	 lkf5SA4m7u1yh5VmvO5dW4ian4xce9vSYxn7v8LqcAu2AhBZWeEXnPOtwPvO4S8ZtF
	 ZeFEWC7rD0ZkZy87QxBDNLCFnQ6WPKiHirctls26IWs0bBzZeecl60+vhfJhTGAHge
	 zlbU0JdjvMC/Q==
From: Donjuanplatinum <donplat@barrensea.org>
To: ojeda@kernel.org,
	linux@roeck-us.net
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donjuanplatinum <donplat@barrensea.org>
Subject: [RFC PATCH] rust: hwmon: add basic hwmon abstractions
Date: Tue, 12 May 2026 23:57:46 +0800
Message-ID: <20260512155747.10136-1-donplat@barrensea.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a minimal Rust abstraction for the Hardware Monitoring (hwmon)
subsystem.

Currently, this abstraction supports a Minimum Viable Product (MVP) scope:
registering a single temperature sensor with the read-only `temp1_input`
attribute. Support for multi-channel, additional sensor types, and
writable attributes is deferred to future patches to keep this initial
foundation reviewable.

The primary architectural challenge in wrapping hwmon is initializing
`struct hwmon_chip_info`, which requires stable, self-referential
pointers to nested NULL-terminated arrays. Instead of relying on complex
macro generation for static allocation, this implementation leverages
a single heap allocation (`KBox`). It safely wires the self-referential
raw pointers using unaliased `&raw mut` during the allocation's
exclusive ownership phase, and then securely seals it by pinning
(`Pin::new_unchecked`).

For resource management, this implementation uses standard Rust RAII
(calling `hwmon_device_unregister` in `Drop`) rather than `devm_`
variants, ensuring natural drop ordering and avoiding complex C-side
trampolines for generic types.

Signed-off-by: Donjuanplatinum <donplat@barrensea.org>
---
 rust/bindings/bindings_helper.h   |   1 +
 rust/kernel/hwmon.rs              | 249 ++++++++++++++++++++++++++++++
 rust/kernel/lib.rs                |   2 +
 samples/rust/Kconfig              |  11 ++
 samples/rust/Makefile             |   1 +
 samples/rust/rust_driver_hwmon.rs |  50 ++++++
 6 files changed, 314 insertions(+)
 create mode 100644 rust/kernel/hwmon.rs
 create mode 100644 samples/rust/rust_driver_hwmon.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 446dbeaf0..e08e9181d 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -60,6 +60,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io-pgtable.h>
diff --git a/rust/kernel/hwmon.rs b/rust/kernel/hwmon.rs
new file mode 100644
index 000000000..5697a1a0d
--- /dev/null
+++ b/rust/kernel/hwmon.rs
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Hardware Monitoring (Hwmon) abstractions.
+//!
+//! C header: [`include/linux/hwmon.h`](srctree/include/linux/hwmon.h)
+//!
+//! Currently, this abstraction supports registering a single temperature sensor with the
+//! `temp1_input` attribute (read-only). Multi-channel support, additional sensor types (fan,
+//! voltage, etc.), and writable attributes will be added in follow-up patches.
+
+use crate::{
+    bindings,
+    device::Device,
+    error::{from_err_ptr, from_result, Result},
+    prelude::*,
+    str::CStr,
+};
+
+use core::marker::{PhantomData, PhantomPinned};
+
+/// Sensor type.
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub enum SensorType {
+    /// Temperature sensor.
+    Temp,
+}
+
+impl TryFrom<u32> for SensorType {
+    type Error = Error;
+
+    fn try_from(value: u32) -> Result<Self> {
+        match value {
+            bindings::hwmon_sensor_types_hwmon_temp => Ok(Self::Temp),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// Temperature attribute.
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub enum TempAttr {
+    /// Temperature input value, in millidegrees Celsius.
+    Input,
+}
+
+impl TryFrom<u32> for TempAttr {
+    type Error = Error;
+
+    fn try_from(value: u32) -> Result<Self> {
+        match value {
+            bindings::hwmon_temp_attributes_hwmon_temp_input => Ok(Self::Input),
+            _ => Err(ENOTSUPP),
+        }
+    }
+}
+
+const HWMON_T_INPUT: u32 = 1u32 << bindings::hwmon_temp_attributes_hwmon_temp_input;
+
+/// The hwmon driver trait.
+#[vtable]
+pub trait Driver: Send + Sync {
+    /// Reads a sensor value.
+    fn read(&self, sensor: SensorType, attr: u32, channel: u32) -> Result<crate::ffi::c_long>;
+
+    /// Returns the sysfs file permission bits for a sensor attribute.
+    fn is_visible(&self, sensor: SensorType, attr: u32, channel: u32) -> u16;
+}
+
+/// Adapter translating C hwmon callbacks to [`Driver`] trait method calls.
+struct Adapter<T: Driver> {
+    _p: PhantomData<T>,
+}
+
+impl<T: Driver> Adapter<T> {
+    /// # Safety
+    ///
+    /// Called by the hwmon core during and after registration with the `drvdata`
+    /// pointer set in `hwmon_device_register_with_info`. The pointer remains valid
+    /// until `hwmon_device_unregister` returns in [`Registration`]'s `Drop`.
+    unsafe extern "C" fn is_visible_callback(
+        drvdata: *const core::ffi::c_void,
+        type_: u32,
+        attr: u32,
+        channel: crate::ffi::c_int,
+    ) -> u16 {
+        if drvdata.is_null() {
+            return 0;
+        }
+        // SAFETY: `drvdata` is `inner_ptr` set in `Registration::new`. The
+        // hwmon core's barrier in `hwmon_device_unregister` ensures this
+        // pointer is valid for the lifetime of any callback invocation.
+        let inner = unsafe { &*drvdata.cast::<HwmonInner<T>>() };
+
+        let sensor = match SensorType::try_from(type_) {
+            Ok(s) => s,
+            Err(_) => return 0,
+        };
+
+        // C core guarantees `channel >= 0`.
+        T::is_visible(&inner.driver, sensor, attr, channel as u32)
+    }
+
+    /// # Safety
+    ///
+    /// Called by the hwmon core. `dev` is the device created during registration, and `val`
+    /// points to writable memory for the result.
+    unsafe extern "C" fn read_callback(
+        dev: *mut bindings::device,
+        type_: u32,
+        attr: u32,
+        channel: crate::ffi::c_int,
+        val: *mut crate::ffi::c_long,
+    ) -> crate::ffi::c_int {
+        from_result(|| {
+            // SAFETY: `dev_get_drvdata` returns the pointer set during registration, valid
+            // until `hwmon_device_unregister` completes.
+            let drvdata = unsafe { bindings::dev_get_drvdata(dev) };
+            if drvdata.is_null() {
+                return Err(EINVAL);
+            }
+            let inner = unsafe { &*drvdata.cast::<HwmonInner<T>>() };
+
+            let sensor = SensorType::try_from(type_)?;
+            // C core guarantees `channel >= 0`.
+            let result = T::read(&inner.driver, sensor, attr, channel as u32)?;
+
+            // SAFETY: `val` is provided by the hwmon core and points to a valid `long`.
+            unsafe { *val = result };
+            Ok(0)
+        })
+    }
+}
+
+/// Container holding the driver and all C structures for hwmon registration.
+struct HwmonInner<T: Driver> {
+    driver: T,
+    ops: bindings::hwmon_ops,
+    temp_config: [u32; 2],
+    temp_channel: bindings::hwmon_channel_info,
+    channel_info_array: [*const bindings::hwmon_channel_info; 2],
+    chip_info: bindings::hwmon_chip_info,
+    _pin: PhantomPinned,
+}
+
+impl<T: Driver> HwmonInner<T> {
+    /// Returns a placeholder with all pointer fields set to null. The returned structure is
+    /// safe to drop — no dynamic resources are held before registration completes.
+    fn new_placeholder(driver: T) -> Self {
+        Self {
+            driver,
+            ops: bindings::hwmon_ops {
+                is_visible: Some(Adapter::<T>::is_visible_callback),
+                visible: 0,
+                read: Some(Adapter::<T>::read_callback),
+                read_string: None,
+                write: None,
+            },
+            temp_config: [0; 2],
+            temp_channel: bindings::hwmon_channel_info {
+                type_: 0,
+                config: core::ptr::null(),
+            },
+            channel_info_array: [core::ptr::null(), core::ptr::null()],
+            chip_info: bindings::hwmon_chip_info {
+                ops: core::ptr::null(),
+                info: core::ptr::null(),
+            },
+            _pin: PhantomPinned,
+        }
+    }
+}
+
+/// A registered hwmon device.
+pub struct Registration<T: Driver> {
+    hwmon_dev: *mut bindings::device,
+    // Held exclusively for drop ordering: keeps `HwmonInner<T>` alive until
+    // `hwmon_device_unregister` returns. The value is never read.
+    #[expect(dead_code)]
+    inner: Pin<KBox<HwmonInner<T>>>,
+}
+
+impl<T: Driver> Registration<T> {
+    /// Registers a new hwmon device.
+    ///
+    /// The device is registered as a child of `parent`. `name` must not contain characters
+    /// rejected by `hwmon_is_bad_char` (hyphens, spaces, asterisks).
+    pub fn new(parent: &Device, name: &CStr, data: T) -> Result<Self> {
+        let mut boxed = KBox::new(HwmonInner::new_placeholder(data), GFP_KERNEL)?;
+
+        // Wire self-referential pointers before pinning. We obtain a mutable raw pointer
+        // from the uniquely-owned `KBox` — no intermediate `&mut` reference is created,
+        // so no aliasing rules are violated.
+        //
+        // SAFETY: `boxed` is exclusively owned. We write only to C-struct fields meant
+        // for one-time initialization, never to `driver`.
+        let inner_ptr: *mut HwmonInner<T> = &raw mut *boxed;
+        unsafe {
+            (*inner_ptr).temp_config = [HWMON_T_INPUT, 0];
+            (*inner_ptr).temp_channel = bindings::hwmon_channel_info {
+                type_: bindings::hwmon_sensor_types_hwmon_temp,
+                config: (*inner_ptr).temp_config.as_ptr(),
+            };
+            (*inner_ptr).channel_info_array =
+                [&raw const (*inner_ptr).temp_channel, core::ptr::null()];
+            (*inner_ptr).chip_info = bindings::hwmon_chip_info {
+                ops: &raw const (*inner_ptr).ops,
+                info: (*inner_ptr).channel_info_array.as_ptr(),
+            };
+        }
+
+        // SAFETY: `HwmonInner<T>` is `!Unpin` (via `PhantomPinned`). All self-referential
+        // pointers are now set to their final values. The struct will never be moved.
+        let inner = unsafe { Pin::new_unchecked(boxed) };
+
+        let drvdata: *mut core::ffi::c_void = inner_ptr.cast();
+
+        // SAFETY: `chip_info` and all nested pointers target memory within the same
+        // allocation, which remains valid until `hwmon_device_unregister` in `Drop`.
+        // `parent.as_raw()` and `name.as_char_ptr()` are valid. The name is copied by
+        // the kernel (via `dev_set_name` → `kvasprintf_const`), so no lifetime issue.
+        let hwmon_dev = from_err_ptr(unsafe {
+            bindings::hwmon_device_register_with_info(
+                parent.as_raw(),
+                name.as_char_ptr(),
+                drvdata,
+                &raw const (*inner_ptr).chip_info,
+                core::ptr::null_mut(),
+            )
+        })?;
+
+        Ok(Self { hwmon_dev, inner })
+    }
+}
+
+impl<T: Driver> Drop for Registration<T> {
+    fn drop(&mut self) {
+        // SAFETY: `hwmon_dev` was returned by a successful registration. This call waits for
+        // all in-flight callbacks before returning.
+        unsafe { bindings::hwmon_device_unregister(self.hwmon_dev) };
+    }
+}
+
+// SAFETY: `T: Driver` requires `T: Send`. `Pin<KBox<HwmonInner<T>>>` is `Send` when `T: Send`.
+unsafe impl<T: Driver> Send for Registration<T> {}
+
+// SAFETY: `T: Driver` requires `T: Sync`, which makes `HwmonInner<T>: Sync`, and therefore
+// `Pin<KBox<HwmonInner<T>>>: Sync`. `Registration` has no public methods that could cause
+// data races through shared references.
+unsafe impl<T: Driver> Sync for Registration<T> {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b72b2fbe0..0ff9d6e6e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -74,6 +74,8 @@
 pub mod fs;
 #[cfg(CONFIG_GPU_BUDDY = "y")]
 pub mod gpu;
+#[cfg(CONFIG_HWMON = "y")]
+pub mod hwmon;
 #[cfg(CONFIG_I2C = "y")]
 pub mod i2c;
 pub mod id_pool;
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c49ab9106..d306b681c 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -161,6 +161,17 @@ config SAMPLE_RUST_DRIVER_AUXILIARY
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_HWMON
+	tristate "Hwmon Driver"
+	depends on HWMON=y
+	help
+	  This option builds the Rust hwmon driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_hwmon.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_SOC
 	tristate "SoC Driver"
 	select SOC_BUS
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 6c0aaa58c..0109d7a8d 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
 obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
+obj-$(CONFIG_SAMPLE_RUST_HWMON)			+= rust_driver_hwmon.o
 obj-$(CONFIG_SAMPLE_RUST_SOC)			+= rust_soc.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
diff --git a/samples/rust/rust_driver_hwmon.rs b/samples/rust/rust_driver_hwmon.rs
new file mode 100644
index 000000000..3362de924
--- /dev/null
+++ b/samples/rust/rust_driver_hwmon.rs
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+//! Rust hwmon device sample.
+
+use kernel::{faux, hwmon, prelude::*};
+
+module! {
+    type: SampleModule,
+    name: "rust_hwmon_driver",
+    authors: ["DonjuanPlatium"],
+    description: "Rust hwmon device sample",
+    license: "GPL",
+}
+
+struct SampleHwmon;
+
+#[vtable]
+impl hwmon::Driver for SampleHwmon {
+    fn read(&self, _sensor: hwmon::SensorType, _attr: u32, _channel: u32) -> Result<c_long> {
+        // Always return 25°C.
+        Ok(25000)
+    }
+
+    fn is_visible(&self, _sensor: hwmon::SensorType, _attr: u32, _channel: u32) -> u16 {
+        // All declared attributes are world-readable.
+        0o444
+    }
+}
+
+struct SampleModule {
+    _hwmon: hwmon::Registration<SampleHwmon>,
+    _faux: faux::Registration,
+}
+
+impl kernel::Module for SampleModule {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_info!("Initialising Rust Hwmon Sample\n");
+
+        let faux = faux::Registration::new(c"rust-hwmon-sample-device", None)?;
+
+        let hwmon = hwmon::Registration::new(faux.as_ref(), c"sample", SampleHwmon)?;
+
+        pr_info!("Registered hwmon device\n");
+
+        Ok(Self {
+            _hwmon: hwmon,
+            _faux: faux,
+        })
+    }
+}
-- 
2.53.0

