Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E99441DEEC;
	Fri, 16 Oct 2026 07:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135483; cv=none; b=uwgO8LpyqmBP7ZyoHdrIquDrdu0KGnD6Cq0cUhHWYASbRMKUjgI8W/Ki3rlUzUrFJiKW7DOdL7AAN/Zsm0E3Bw+PRZ3YzEq5p9PzfsCxUcojfSRIqXPuBanJCGcj+w5W0OtPTlf7f1U43+oFbRQpOAnBoc1EiQOTNwUyRp+QnzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135483; c=relaxed/simple;
	bh=/TNo/HyJWs2f9V7q9bVt6K2Jrxi2wQMz8Evhpy4ayM4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ClyUykF4IrxkrthF6Yj+q79SoUOjwHqOAwOJ59oNQpRNVfp425ktRrq81S/3kDeGf+/1vSzpwPzNuEj4Bn5LcqNXE/Q5vAtQ9zcidHkiWg3fEp4xldvQQCu39aoRzepM14b8yc1CUyZTyHopc6SIhR8yJimyI1Bs97UVW0Xj4R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=kdl4VgKa; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="kdl4VgKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792135466; bh=z/sQRDDeCohuuqw90paphvW8Tt4pEwiJw80zNuKI0CA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kdl4VgKayw7dyZpU5Iur/j0sxwTnyFE1z4JAmOaCBGIbkx+xrD/wkcqVwhn4aQGN6
	 75XMM0eVJZFZJMxuMLwFT5S4bsvq9SPltFiPmDU4tQH5WSZqmL5sCTtvovbl4va4+q
	 HSJ4p1EIxYSJivGCDa8kCf1Yg6jHmanvqYnDk5I4=
Received: from [172.24.48.1] ([2409:8951:a22:b25:d1a1:62d3:eb69:e679])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 6171AA01; Fri, 16 Oct 2026 15:24:23 +0800
X-QQ-mid: xmsmtpt1792135464tikg9880h
Message-ID: <tencent_95E7F9B5CE294CA4027A0CD4C550B454050A@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5IhYQfOw+6AZilr6hhN4ZZKg0uVtgBCwqYdC3qsjPUQ79G8iBoT
	 4YfYS92xD3l6T3xBXYN2JMslu+ATyd4xn3TXMVSnQkMg4xz4ck4WZyzBX2JN6U7uq8cfrdY9UO1P
	 4uFV2hLiLMsE32XRH1yIRoAUCPkm3luZrB/W1HEiFy7YtVoy5V0P2jqm0jSVJ3ZQXSg3Z1+6SZK+
	 Cb8WH0xTeaJYIQDTDRjjBAi3wms02urg9mBE7bEsxisSLzON2piQQkOWNYEzu512kxOQu0IU5yUm
	 ruhR/JVCNJgStabrDMyiV4TYKq/nNvwRKRq50l9SlTMn5WX371qUt89O76i3jDw8qbmWDk6lS2jm
	 8B8Fj3yC4ouiyrnJ9WqFS0W2uXbGeqCEKnqKawsLKSxpg2/YZVVo8VoPmJkf4uoBf14A41OnFC+9
	 jDujtVtubKam8bjgoCtVpIqPt3CGQORTINee1b8K0QFrOi8cenBOR5kMEn+dFATtk4+iMFMqXHRK
	 tIy6lUA1cHqMIV413sXjCmW8WBnqSP0DDXKoe51CBwRubzjiEThi0nnTrHdOmmwYMx8yhoAkE0ia
	 S60trze6iF7EWp6rXxL1blW2vguJDv6rrA2H5ZVRlICg/bhVfRQcHfwnv9tezDE2QWtjUhwOG8pz
	 6JUDvJK5ZrcX/JnGnEwz9Wti8pgCCCvwb2c9PkE3bI+D8fwNkJ9Xpc+ds52AAKJBbXwmssNio+WE
	 L1LmzBDGrntFSsZgazESjkLbAHHZmIAWeG/eMNYI4+1H7CEVYZA9psaNrDeBnVWZCMhtd+9696c2
	 bMlJk8bnINPJlFbdPGLyqGNaq7Rxh1LfPKGaTnr4Zj70QDQ5EWHo7vUXW66R3gZSJoH1aSMKYpsi
	 yhOXEYCGiwNImNWMZx1CH4ACcNvi6xOOLNCCzrJ1M2+LbYeEjajINOfcydHxm7Rx37PDRdzr1h8V
	 bOU691pmtBT6qXBSyQCaIPd8CCXeO8bn7aRa8430gD2Qd7Nz10Q8rRxGNW3G6ueLemPu+aB2PV78
	 IX8EPyp2tpmn2PO7tO
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: skxby <2374604267@qq.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Donjuanplatinum <donplat@barrensea.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: hwmon: add hwmon abstractions
Date: Fri, 16 Oct 2026 15:24:15 +0800
X-OQ-MSGID: <179213545523.40444.17231983089796912234@qq.com>
In-Reply-To: <179213545522.40444.8748988877722946371@qq.com>
References: <179213545522.40444.8748988877722946371@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

>From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
From: skxby <2374604267@qq.com>
Date: Fri, 16 Oct 2026 15:12:27 +0800
Subject: [PATCH 1/2] rust: hwmon: add hwmon abstractions

Add Rust abstractions for the hwmon subsystem.

The main type is Registration<T>, which owns and pins its inner state,
registers the hwmon device, and unregisters it on drop. A Driver trait
provides callbacks for the temperature and chip attribute families; the
chip callbacks are optional, following the existing #[vtable] idiom used
by other subsystems. Channel configuration masks are derived from the
modeled attribute enums.

This is a rework of the abstraction proposed in the RFC "rust: hwmon:
add basic hwmon abstractions" [1], brought up to the current rust tree:
registration does not use devm, the sensor type enumeration covers the
chip family in addition to the temperature family, and the resource is
released explicitly on the registration error path.

[1] https://lore.kernel.org/all/20260512155747.10136-1-donplat@barrensea.org/

Signed-off-by: skxby <2374604267@qq.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/hwmon.rs            | 491 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 3 files changed, 494 insertions(+)
 create mode 100644 rust/kernel/hwmon.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index c706dda..1fc7a86 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -62,6 +62,7 @@
 #include <linux/firmware.h>
 #include <linux/fwctl.h>
 #include <linux/fs.h>
+#include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io-pgtable.h>
diff --git a/rust/kernel/hwmon.rs b/rust/kernel/hwmon.rs
new file mode 100644
index 0000000..d7e3fd6
--- /dev/null
+++ b/rust/kernel/hwmon.rs
@@ -0,0 +1,491 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Hardware Monitoring (Hwmon) abstractions.
+//!
+//! C header: [`include/linux/hwmon.h`](srctree/include/linux/hwmon.h)
+//!
+//! This abstraction supports registering temperature sensors with the full standard
+//! `temp[1-*]` attribute set, plus the chip-level attribute channel. Which attributes
+//! a driver actually exposes is decided by [`Driver::is_visible`] /
+//! [`Driver::chip_is_visible`]. Additional sensor types (voltage, current, power, fan)
+//! and `read_string` are deferred to a future version.
+
+use crate::{
+    bindings,
+    device::{Bound, Device},
+    error::{from_err_ptr, from_result, Error, Result},
+    error::code::{EINVAL, EOPNOTSUPP},
+    ffi::{c_int, c_long},
+    prelude::*,
+    str::CStr,
+};
+
+use core::marker::{PhantomData, PhantomPinned};
+
+/// Sensor type.
+///
+/// `Chip` corresponds to `hwmon_chip`, the first member of `enum hwmon_sensor_types`
+/// and the channel carrying chip-level attributes such as `update_interval`.
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub enum SensorType {
+    /// Chip-level attributes (`hwmon_chip_*`).
+    Chip,
+    /// Temperature sensor.
+    Temp,
+}
+
+impl TryFrom<u32> for SensorType {
+    type Error = Error;
+
+    fn try_from(value: u32) -> Result<Self> {
+        match value {
+            bindings::hwmon_sensor_types_hwmon_chip => Ok(Self::Chip),
+            bindings::hwmon_sensor_types_hwmon_temp => Ok(Self::Temp),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// Temperature attributes covered by the abstraction layer.
+///
+/// This is the subset that can be expressed in terms of a temperature channel for any
+/// sensor: input, limits, hysteresis and alarm flags. Attributes that exist only for
+/// specific hardware (e.g. `crit`, `emergency`) are not part of the common shape and are
+/// left out rather than modelled and then filtered per driver.
+///
+/// A driver only exposes the subset it implements; [`Driver::is_visible`]
+/// returns `0` for the rest, and the hwmon core will not create the sysfs file.
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub enum TempAttr {
+    /// `temp1_input`, millidegrees Celsius, read-only.
+    Input,
+    /// `temp1_min` (low limit), millidegrees Celsius.
+    Min,
+    /// `temp1_max` (high limit), millidegrees Celsius.
+    Max,
+    /// `temp1_min_hyst`, millidegrees Celsius.
+    MinHyst,
+    /// `temp1_max_hyst`, millidegrees Celsius.
+    MaxHyst,
+    /// `temp1_min_alarm`, 0 or 1, read-only.
+    MinAlarm,
+    /// `temp1_max_alarm`, 0 or 1, read-only.
+    MaxAlarm,
+}
+
+impl TryFrom<u32> for TempAttr {
+    type Error = Error;
+
+    fn try_from(value: u32) -> Result<Self> {
+        match value {
+            bindings::hwmon_temp_attributes_hwmon_temp_input => Ok(Self::Input),
+            bindings::hwmon_temp_attributes_hwmon_temp_min => Ok(Self::Min),
+            bindings::hwmon_temp_attributes_hwmon_temp_max => Ok(Self::Max),
+            bindings::hwmon_temp_attributes_hwmon_temp_min_hyst => Ok(Self::MinHyst),
+            bindings::hwmon_temp_attributes_hwmon_temp_max_hyst => Ok(Self::MaxHyst),
+            bindings::hwmon_temp_attributes_hwmon_temp_min_alarm => Ok(Self::MinAlarm),
+            bindings::hwmon_temp_attributes_hwmon_temp_max_alarm => Ok(Self::MaxAlarm),
+            _ => Err(EOPNOTSUPP),
+        }
+    }
+}
+
+/// Chip-level attributes covered by the abstraction layer.
+///
+/// Mirror of the `hwmon_chip_*` attribute namespace. Only the attributes that are
+/// meaningful for a generic chip are listed; the remaining ones are deferred until a
+/// driver needs them.
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub enum ChipAttr {
+    /// `update_interval`, milliseconds.
+    UpdateInterval,
+}
+
+impl TryFrom<u32> for ChipAttr {
+    type Error = Error;
+
+    fn try_from(value: u32) -> Result<Self> {
+        match value {
+            bindings::hwmon_chip_attributes_hwmon_chip_update_interval => Ok(Self::UpdateInterval),
+            _ => Err(EOPNOTSUPP),
+        }
+    }
+}
+
+/// Bitmask declaring the temperature attribute set in the temperature channel info.
+///
+/// Derived from [`TempAttr`] so that the declared channel shape and the modelled
+/// attribute set cannot drift apart. Visibility is filtered afterwards by
+/// [`Driver::is_visible`].
+const TEMP_ATTR_MASK: u32 = 1u32 << bindings::hwmon_temp_attributes_hwmon_temp_input
+    | 1u32 << bindings::hwmon_temp_attributes_hwmon_temp_min
+    | 1u32 << bindings::hwmon_temp_attributes_hwmon_temp_max
+    | 1u32 << bindings::hwmon_temp_attributes_hwmon_temp_min_hyst
+    | 1u32 << bindings::hwmon_temp_attributes_hwmon_temp_max_hyst
+    | 1u32 << bindings::hwmon_temp_attributes_hwmon_temp_min_alarm
+    | 1u32 << bindings::hwmon_temp_attributes_hwmon_temp_max_alarm;
+
+/// Bitmask declaring the chip attribute set in the chip channel info.
+///
+/// Derived from [`ChipAttr`]. A driver that does not implement any chip attribute
+/// leaves its `chip_config` zeroed, in which case no chip attribute file is created.
+const CHIP_ATTR_MASK: u32 =
+    1u32 << bindings::hwmon_chip_attributes_hwmon_chip_update_interval;
+
+/// The hwmon driver trait.
+///
+/// # Concurrency and Driver Responsibilities
+///
+/// The hwmon C core provides **no internal locking** for attribute access. When user-space
+/// reads or writes `/sys/class/hwmon/hwmon*/temp*_*`, the core directly invokes the
+/// registered callbacks with a **shared `&self` reference** to `HwmonInner<T>`.
+///
+/// - **Read-only operations** ([`Driver::read`]) receiving `&self` are safe if the hardware
+///   state is read-only or the driver uses interior mutability (e.g., `Mutex<HwState>`).
+/// - **Write operations** ([`Driver::write`]) **must** synchronize mutable access inside the
+///   driver implementation. Concurrent writes to the same attribute, or a write racing with
+///   a read, are **not serialized by hwmon** -- the driver must use `Mutex`, `RwLock`, or
+///   hardware-level atomics as appropriate.
+///
+/// **Lifetime guarantee**: The `drvdata` pointer (`&HwmonInner<T>`) remains valid for the
+/// entire duration of every callback. `Drop::drop` calls `hwmon_device_unregister`, which
+/// **blocks until all in-flight callbacks return** before releasing the allocation. Drivers
+/// need not implement additional lifetime tracking beyond Rust's ownership model.
+///
+/// # Chip attributes
+///
+/// The three `chip_*` methods are optional. A driver that does not implement
+/// [`Driver::chip_is_visible`] exposes no chip attribute at all: no entry is created in
+/// the corresponding channel config, and the hwmon core never calls back for one.
+#[vtable]
+pub trait Driver: Send + Sync {
+    /// Reads a temperature attribute value, in millidegrees Celsius.
+    fn read(&self, attr: TempAttr, channel: u32) -> Result<c_long>;
+
+    /// Writes a temperature attribute value, in millidegrees Celsius.
+    fn write(&self, attr: TempAttr, channel: u32, value: c_long) -> Result<()>;
+
+    /// Returns the sysfs file permission bits for a temperature attribute.
+    fn is_visible(&self, attr: TempAttr, channel: u32) -> u16;
+
+    /// Reads a chip-level attribute value.
+    #[optional]
+    fn chip_read(&self, _attr: ChipAttr) -> Result<c_long>;
+
+    /// Writes a chip-level attribute value.
+    #[optional]
+    fn chip_write(&self, _attr: ChipAttr, _value: c_long) -> Result<()>;
+
+    /// Returns the sysfs file permission bits for a chip-level attribute.
+    #[optional]
+    fn chip_is_visible(&self, _attr: ChipAttr) -> u16;
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
+        channel: c_int,
+    ) -> u16 {
+        if drvdata.is_null() {
+            return 0;
+        }
+        // SAFETY: `drvdata` is `inner_ptr` set in `Registration::new`. The
+        // hwmon core's barrier in `hwmon_device_unregister` ensures this
+        // pointer is valid for the lifetime of any callback invocation.
+        let inner = unsafe { &*drvdata.cast::<HwmonInner<T>>() };
+
+        match SensorType::try_from(type_) {
+            Ok(SensorType::Chip) => match ChipAttr::try_from(attr) {
+                // A driver that does not implement chip attributes exposes none.
+                Ok(a) if T::HAS_CHIP_IS_VISIBLE => T::chip_is_visible(&inner.driver, a),
+                _ => 0,
+            },
+            Ok(SensorType::Temp) => match TempAttr::try_from(attr) {
+                // C core guarantees `channel >= 0`.
+                Ok(a) => T::is_visible(&inner.driver, a, channel as u32),
+                Err(_) => 0,
+            },
+            // Sensor types the abstraction does not model are invisible.
+            Err(_) => 0,
+        }
+    }
+
+    /// # Safety
+    ///
+    /// Called by the hwmon core. `dev` is the device created during registration, and `val`
+    /// points to writable memory for the result. This callback is only installed when the
+    /// driver implements at least one readable attribute kind.
+    unsafe extern "C" fn read_callback(
+        dev: *mut bindings::device,
+        type_: u32,
+        attr: u32,
+        channel: c_int,
+        val: *mut c_long,
+    ) -> c_int {
+        from_result(|| {
+            // SAFETY: `dev_get_drvdata` returns the pointer set during registration, valid
+            // until `hwmon_device_unregister` completes.
+            let drvdata = unsafe { bindings::dev_get_drvdata(dev) };
+            if drvdata.is_null() {
+                return Err(EINVAL);
+            }
+            // SAFETY: `drvdata` is the `HwmonInner<T>` pointer set in `Registration::new`.
+            // The hwmon core's barrier in `hwmon_device_unregister` keeps it valid for the
+            // lifetime of every callback invocation.
+            let inner = unsafe { &*drvdata.cast::<HwmonInner<T>>() };
+
+            let result = match SensorType::try_from(type_)? {
+                SensorType::Chip => T::chip_read(&inner.driver, ChipAttr::try_from(attr)?)?,
+                // C core guarantees `channel >= 0`.
+                SensorType::Temp => {
+                    T::read(&inner.driver, TempAttr::try_from(attr)?, channel as u32)?
+                }
+            };
+
+            // SAFETY: `val` is provided by the hwmon core and points to a valid `long`.
+            unsafe { *val = result };
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// Same `drvdata` argument as [`Self::read_callback`]. Additional constraints:
+    ///
+    /// - `Driver::write` receives `&self`; the driver implementation must synchronize
+    ///   mutable access itself (`Mutex`/`RwLock`) -- hwmon does not serialize read/write.
+    /// - Callback-side `&HwmonInner<T>` validity is identical: `Registration` not dropped
+    ///   means the `KBox` allocation is alive, so the raw pointer may be dereferenced.
+    ///
+    /// `write` returns `Result<()>`; `from_result` converts errors to C errno (0 on success).
+    unsafe extern "C" fn write_callback(
+        dev: *mut bindings::device,
+        type_: u32,
+        attr: u32,
+        channel: c_int,
+        val: c_long,
+    ) -> c_int {
+        from_result(|| {
+            // SAFETY: `dev_get_drvdata` returns the pointer set during registration, valid
+            // until `hwmon_device_unregister` completes.
+            let drvdata = unsafe { bindings::dev_get_drvdata(dev) };
+            if drvdata.is_null() {
+                return Err(EINVAL);
+            }
+            // SAFETY: `drvdata` is the `HwmonInner<T>` pointer set in `Registration::new`.
+            // The hwmon core's barrier in `hwmon_device_unregister` keeps it valid for the
+            // lifetime of every callback invocation.
+            let inner = unsafe { &*drvdata.cast::<HwmonInner<T>>() };
+
+            match SensorType::try_from(type_)? {
+                SensorType::Chip => T::chip_write(&inner.driver, ChipAttr::try_from(attr)?, val)?,
+                // C core guarantees `channel >= 0`.
+                SensorType::Temp => {
+                    T::write(&inner.driver, TempAttr::try_from(attr)?, channel as u32, val)?
+                }
+            }
+            Ok(0)
+        })
+    }
+}
+
+/// Container holding the driver and all C structures for hwmon registration.
+///
+/// # Initialization Invariants (Self-Referential Structure)
+///
+/// `HwmonInner<T>` contains self-referential raw pointers that must be wired in a specific
+/// order:
+///
+/// 1. **Field initialization**: All owned data (driver, ops, chip_config, chip_channel,
+///    temp_config, temp_channel, etc.) are written into the `KBox` allocation first. Any
+///    dynamic collections (e.g. `KVec` channels) must be fully built before step 2--
+///    reallocation invalidates pointers.
+///
+/// 2. **Pointer wiring**: Once the final address is known, write raw pointers via `&raw mut`:
+///    `chip_info.ops` points to `inner.ops`, `channel_info_array[0]` points to
+///    `inner.chip_channel`, `channel_info_array[1]` to `inner.temp_channel`, etc. No external
+///    references exist yet, so `&raw mut` is safe.
+///
+/// 3. **Pinning**: Call `Pin::new_unchecked` to freeze the address. From this point onward,
+///    the allocation cannot move, ensuring all interior pointers remain valid.
+///
+/// 4. **Registration**: Pass `&inner.chip_info` and `&inner` (as drvdata) to
+///    `hwmon_device_register_with_info`. C now holds these pointers until unregistration.
+///
+/// 5. **Deallocation fence**: `Drop::drop` calls `hwmon_device_unregister`, which blocks
+///    until all callbacks return. Only after it returns is the `KBox` deallocated.
+///
+/// Violating this order (e.g., moving `inner` after wiring, or dropping before unregister)
+/// results in **use-after-free or dangling pointers in C callbacks**.
+struct HwmonInner<T: Driver> {
+    driver: T,
+    ops: bindings::hwmon_ops,
+    chip_config: [u32; 1],
+    temp_config: [u32; 2],
+    chip_channel: bindings::hwmon_channel_info,
+    temp_channel: bindings::hwmon_channel_info,
+    channel_info_array: [*const bindings::hwmon_channel_info; 3],
+    chip_info: bindings::hwmon_chip_info,
+    _pin: PhantomPinned,
+}
+
+impl<T: Driver> HwmonInner<T> {
+    /// Returns a placeholder with all pointer fields set to null. The returned structure is
+    /// safe to drop -- no dynamic resources are held before registration completes.
+    fn new_placeholder(driver: T) -> Self {
+        // A driver that exposes no chip attribute must not advertise the chip channel
+        // either: leaving `chip_config` zeroed makes the channel carry no attributes, and
+        // `is_visible` would not be consulted for it in the first place.
+        let chip_config = if T::HAS_CHIP_IS_VISIBLE {
+            [CHIP_ATTR_MASK]
+        } else {
+            [0]
+        };
+
+        Self {
+            driver,
+            ops: bindings::hwmon_ops {
+                is_visible: Some(Adapter::<T>::is_visible_callback),
+                visible: 0,
+                read: Some(Adapter::<T>::read_callback),
+                read_string: None,
+                write: Some(Adapter::<T>::write_callback),
+            },
+            chip_config,
+            temp_config: [TEMP_ATTR_MASK, 0],
+            chip_channel: bindings::hwmon_channel_info {
+                type_: 0,
+                config: core::ptr::null(),
+            },
+            temp_channel: bindings::hwmon_channel_info {
+                type_: 0,
+                config: core::ptr::null(),
+            },
+            channel_info_array: [
+                core::ptr::null(),
+                core::ptr::null(),
+                core::ptr::null(),
+            ],
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
+    ///
+    /// `parent` is `&Device<Bound>`: rust-next's `Device<Ctx>` is generic over
+    /// `DeviceContext`, and a registered parent device always has the `Bound` context.
+    /// The RFC's unparameterized `&Device` does not compile against that split (E0308).
+    pub fn new(parent: &Device<Bound>, name: &CStr, data: T) -> Result<Self> {
+        let mut boxed = KBox::new(HwmonInner::new_placeholder(data), GFP_KERNEL)?;
+
+        // Wire self-referential pointers before pinning. We obtain a mutable raw pointer
+        // from the uniquely-owned `KBox` -- no intermediate `&mut` reference is created,
+        // so no aliasing rules are violated.
+        let inner_ptr: *mut HwmonInner<T> = &raw mut *boxed;
+        // SAFETY: `boxed` is exclusively owned at this point. We write only to C-struct
+        // fields meant for one-time initialization, never to `driver`.
+        unsafe {
+            (*inner_ptr).chip_channel = bindings::hwmon_channel_info {
+                type_: bindings::hwmon_sensor_types_hwmon_chip,
+                config: (*inner_ptr).chip_config.as_ptr(),
+            };
+            (*inner_ptr).temp_channel = bindings::hwmon_channel_info {
+                type_: bindings::hwmon_sensor_types_hwmon_temp,
+                config: (*inner_ptr).temp_config.as_ptr(),
+            };
+            // The channel info array is NULL-terminated, as required by the C core.
+            (*inner_ptr).channel_info_array = [
+                &raw const (*inner_ptr).chip_channel,
+                &raw const (*inner_ptr).temp_channel,
+                core::ptr::null(),
+            ];
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
+        // the kernel (via `dev_set_name` -> `kvasprintf_const`), so no lifetime issue.
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
+// SAFETY: `Registration` contains two fields:
+// - `hwmon_dev: *mut bindings::device`: this raw pointer is only ever read once, in
+//   `Drop::drop`, to call `hwmon_device_unregister`. The pointed-to `struct device` is
+//   owned by the hwmon core and outlives the `Registration` (unregister blocks until all
+//   in-flight callbacks finish). Moving the `Registration` across threads merely moves the
+//   pointer value; the device is never accessed through it except in `drop`, which has
+//   exclusive access (`&mut self`). No data race is possible.
+// - `inner: Pin<KBox<HwmonInner<T>>>`: `KBox<T>` is `Send` when `T: Send`, and `Pin<P>`
+//   preserves `Send`. `T: Driver` requires `T: Send`, so the field is `Send`.
+// Therefore `Registration<T>` is `Send`.
+unsafe impl<T: Driver> Send for Registration<T> {}
+
+// SAFETY: sharing a `&Registration<T>` cannot produce a data race:
+// - `hwmon_dev` is never read through a shared reference (only `drop` reads it, via
+//   `&mut self`).
+// - `inner: Pin<KBox<HwmonInner<T>>>` is `Sync` when `HwmonInner<T>` is `Sync`.
+//   `HwmonInner<T>` is `Sync` because `T: Driver` requires `T: Sync`, and the remaining
+//   fields are C structures written once during registration and only read by the hwmon
+//   core (which synchronizes access with the unregister barrier).
+// Therefore `Registration<T>` is `Sync`.
+unsafe impl<T: Driver> Sync for Registration<T> {}
+
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index a4747f7..541d171 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -80,6 +80,8 @@ pub mod fs;
 pub mod fwctl;
 #[cfg(CONFIG_GPU_BUDDY = "y")]
 pub mod gpu;
+#[cfg(CONFIG_HWMON = "y")]
+pub mod hwmon;
 #[cfg(CONFIG_I2C = "y")]
 pub mod i2c;
 pub mod id_pool;

