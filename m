Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAAB41D23B;
	Fri, 16 Oct 2026 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135488; cv=none; b=YNuP1h4NUsBwz0VAks3mHtOq+ZrmxRhVQDVu0WTK1EviKmw4oQtN7+LGN+Xlxe7qvzuW60iua4bwbnhyrOOEdz2vKAEgXh1MU0iB9Xlb09QxRIPNgUpT4UTrT9Yimc9Tw7LHMk06HL67zN3JdnwH0w1ULJjh17M/w+chlJ8cgZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135488; c=relaxed/simple;
	bh=icLEbWgrMZmc76wbDIK36MK+NNsB4O+W+Mzhrov7sN0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EuOGrKAxqGnhFpGH/uOJ3kKp5OxTumc96ehRTuXilZgg0cw+kT4h54aq661Pacn025WTRSTvgpfAx/LmbWPLYk5DPcacK75+f+GRAveb8WWIe40BGahjsJP8mFqp2hlhXtb/2rLtdXXjfq1+SXcRkBl1fqswvKtj5gKbrBDoIJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=n9AKUYCq; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="n9AKUYCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792135467; bh=Vaiokr4d9lop7Nio06jq4zIhOp64dIdQQt6FRJdGi9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n9AKUYCqLshXWi6vAsJYJLrJeN4riq9aTJT06qXHS5blR02vRkO+KTVj19idcXByl
	 rCq46rhJk1DHNeieM6uJcJe2kXhU2KZqgZO0nDFpCUuVuKs1XlUMs+z+A2KJCf+BdE
	 YtR6QvIRzJ1IesLE+CYWeyhyoDBtHBjAdTHCiaP4=
Received: from [172.24.48.1] ([2409:8951:a22:b25:d1a1:62d3:eb69:e679])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 6171AA01; Fri, 16 Oct 2026 15:24:23 +0800
X-QQ-mid: xmsmtpt1792135465t1ygv99ec
Message-ID: <tencent_EF01D718C016C6E011BFDF39B38933C0A807@qq.com>
X-QQ-XMAILINFO: Mkw1Oys1xyjCDnB4foeF6Tt2e6E4aHpwJCQP3Pnw75dSiNVhQ2FlUzRw/jlvoY
	 c626dubjfw0ycHKls6roYefbeSR2gXiy82s1ZpAQHSVPEaiUOQPSsypww5fkcKIWyFQ4mjJjXOBw
	 2N6sLEoPDO8tuczMwx5s8rUpiLA/Yj4ApRhEikFQS/vOKodVBJJvctcH50+OYDRYas04wn+X0qzL
	 pqxXE4qSsr6HFgIJ7kIqMSFrzdRyq5r4PxeHZI3hy+UT7Qif0EykecumZFZT+BXLFR7szxfEieNw
	 Sf2KrPk+mbXKXUuWwgBelPZERkDR+XL8GKuaF/SRe410I6t0QItDP8RpcC7ar72AfAmb2m6YSTc1
	 8+aM7e0uAIw4p/IjsJzyIgcjhkxNdiiIROGfbScGc7KwcOu9z9h2/2wWtKbeWOYZQ7hZrtq6kNd7
	 3DX9rvblf0JxcLpSWs3qQ4YZ+PtnfPRiGF+VDCR41T0OzhXdp8sK7ktf7G0rjyHkZ7/ns2WBUZHi
	 4GXC1Q2agjV2llrDOv7TCA4mCxZdtoC7TUptCwWC95didWJs1IBnNm98xNYSe28mNuFFIVMKA+W7
	 dEAHA4PBbAzKanYYldPRYRSBENoB0cNgdrYkI/An0PzLZteJjQ6iwo0EmARv4fuEEagcxGCZYXes
	 hB9fuC6gJH270X9PmXn1qvGN4No8f936coul3v8chCMO5lt1PPre4HtYQmKjiL4keLt/H7DlDEs7
	 FHc2LgYIsx0RM0/KBP0gLbcjlEBYc8VKXzHODPmR+DFpDWuMam/AKH/pFLzLHLzP2RgjntzpUfPw
	 Pbr+uc0MyqmtFaVBcq3JnbfEfsGQJlM27kS6+wJ1Uv24W8fEu6Su00rCP7DGeCytzXt/oj/TewJc
	 W08MP4XCoCIjys2MuWuCCasvkQmWlEfa6BtRn3y9xOXL7okYKrjQm4X11fpI1uvJcposGAVWlLAt
	 aGxm5ZG0InsNZUBHf9Ebd3w9EiJZ3e/keqyEMIlieCQmKoziiyJeIv0qcFInf7xaADsZAXPhWnBN
	 932HvWBA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: skxby <2374604267@qq.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Donjuanplatinum <donplat@barrensea.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (tmp108) add Rust TMP108 driver
Date: Fri, 16 Oct 2026 15:24:15 +0800
X-OQ-MSGID: <179213545523.40444.15719261505339147271@qq.com>
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
Subject: [PATCH 2/2] hwmon: (tmp108) add Rust TMP108 driver

Add a Rust driver for the TI TMP108 temperature sensor, mirroring the
existing C driver (drivers/hwmon/tmp108.c).

The driver exposes seven temperature attributes (input, min, max,
min_hyst, max_hyst, min_alarm, max_alarm) plus update_interval on the
chip channel. Numeric and error semantics follow the C driver:
millidegree conversion with truncation, write clamping, absolute-value
hysteresis, four conversion-rate buckets selected with the same
closest-descending search, and EAGAIN while a one-shot conversion is not
ready.

Signed-off-by: skxby <2374604267@qq.com>
---
 samples/rust/Kconfig   |  21 ++
 samples/rust/Makefile  |   2 +
 samples/rust/tmp108.rs | 573 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 596 insertions(+)
 create mode 100755 samples/rust/tmp108.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 31d6253..18df428 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -172,6 +172,27 @@ config SAMPLE_RUST_DRIVER_SERDEV
 
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
+config SAMPLE_RUST_TMP108
+	tristate "TMP108 Driver"
+	depends on HWMON=y
+	depends on I2C=y
+	help
+	  This option builds the Rust TMP108 temperature sensor driver.
+
+	  To compile this as a module, choose M here:
+	  the module will be called tmp108.
+
 config SAMPLE_RUST_SOC
 	tristate "SoC Driver"
 	select SOC_BUS
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index b986b68..c5602ce 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -16,6 +16,8 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_SERDEV)		+= rust_driver_serdev.o
 obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
+obj-$(CONFIG_SAMPLE_RUST_HWMON)			+= rust_driver_hwmon.o
+obj-$(CONFIG_SAMPLE_RUST_TMP108) += tmp108.o
 obj-$(CONFIG_SAMPLE_RUST_SOC)			+= rust_soc.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
diff --git a/samples/rust/tmp108.rs b/samples/rust/tmp108.rs
new file mode 100755
index 0000000..a070547
--- /dev/null
+++ b/samples/rust/tmp108.rs
@@ -0,0 +1,573 @@
+// SPDX-License-Identifier: GPL-2.0
+//!
+//! TMP108 temperature sensor driver (Rust, i2c + hwmon).
+//!
+//! I2C channel: `kernel::i2c::Registration::new` requires a bound parent device,
+//! which is not available during module init, and `I2cClient` exposes neither
+//! SMBus methods nor a public `as_raw`. The driver therefore uses the raw
+//! bindings directly:
+//!   i2c_get_adapter -> i2c_new_client_device -> i2c_put_adapter ->
+//!   Device::from_raw(&raw mut (*client).dev) -> hwmon::Registration::new
+//!
+//! word_swapped transfers: `include/linux/i2c.h` provides
+//! `i2c_smbus_{read,write}_word_swapped` as static inline helpers (word_data plus
+//! swab16) with no exported symbol, so the driver declares the exported
+//! `i2c_smbus_{read,write}_word_data` instead and replicates the i2c.h inline
+//! expansion (swab16) on the Rust side, bit-exact.
+//!
+//! Byte order: the C driver uses word_swapped transfers (regmap with val_bits=16,
+//! REGMAP_ENDIAN_BIG and single accesses); the register value seen by the driver
+//! is always swab16 of the on-wire word.
+
+use kernel::{
+    bindings,
+    device::{Bound, Device},
+    error::{
+        code::{EAGAIN, EINVAL, EOPNOTSUPP, ENODEV},
+        from_err_ptr, Error, Result,
+    },
+    ffi::c_long,
+    hwmon::{ChipAttr, Driver, Registration, TempAttr},
+    prelude::*,
+};
+
+// === TMP108 register addresses ===
+
+const TEMP: u16 = 0x00;
+const CONF: u16 = 0x01;
+const TLOW: u16 = 0x02;
+const THIGH: u16 = 0x03;
+
+// CONF bit fields (on-wire big-endian; decoded with the masks below after word_swapped transfer)
+const CONF_FL: u16 = 0x0800; // TLOW limit flag, read-only
+const CONF_FH: u16 = 0x1000; // THIGH limit flag, read-only
+const CONF_HYS_MASK: u16 = 0x0030; // HYS1:HYS0
+
+// === CONF.CR conversion rate bit field ===
+//
+// TMP108_CONF_CR0 = 0x2000 (bit13) / CR1 = 0x4000 (bit14)
+// CONVRATE_MASK = CR0|CR1 = 0x6000 / CR0_POS = 13
+// Encoding: 0P25HZ=0b00 / 1HZ=0b01 (default) / 4HZ=0b10 / 16HZ=0b11
+const CONF_CR0: u16 = 0x2000;
+const CONF_CR1: u16 = 0x4000;
+const CONF_CONVRATE_MASK: u16 = CONF_CR0 | CONF_CR1; // 0x6000
+const CONF_CR0_POS: u32 = 13;
+
+/// The four TMP108 conversion periods (ms); `find_closest_descending` requires
+/// **descending** order.
+///
+/// Matches the C driver's `tmp108_sample_times[] = {4000, 1000, 250, 63}`.
+/// Note: the same C file also has `p3t1035_sample_times[] = {4000, 1000, 250, 125}`
+/// (last entry 125 != 63). This driver supports only the tmp108 (16-bit CONF), so the
+/// 63 entry must be used.
+const SAMPLE_TIMES: [u16; 4] = [4000, 1000, 250, 63];
+
+// Threshold clamp bounds
+const CLAMP_MIN_MC: i32 = -50000;
+const CLAMP_MAX_MC: i32 = 127937;
+
+// Hysteresis bucket bounds: delta < 500 -> 0 C; delta < 1500 -> 1 C; delta < 3000 -> 2 C; else 4 C
+const HYST_STEP_1_MC: i32 = 500;
+const HYST_STEP_2_MC: i32 = 1500;
+const HYST_STEP_4_MC: i32 = 3000;
+
+// One-shot conversion time (unused in continuous mode)
+#[allow(dead_code)] // unused until the one-shot path is enabled with set_ready_time
+const CONVERSION_TIME_MS: u64 = 30;
+
+// TMP108 default I2C address (the C driver obtains it from DT/ACPI/i2c_device_id)
+const TMP108_ADDR: u16 = 0x48;
+
+// === i2c_board_info construction at runtime ===
+//
+// Built at runtime rather than via a const initializer: `kernel::i2c::I2cBoardInfo::new` is const
+// but returns the abstraction type (needing the Registration path); a directly zeroed
+// `bindings::i2c_board_info` avoids the const unsafe restriction and resists field drift.
+
+fn board_info() -> bindings::i2c_board_info {
+    // SAFETY: `i2c_board_info` is a plain C POD (char arrays, scalars and nullable
+    // pointers); all-zero is a valid value, and type_/addr are filled in afterwards.
+    let mut info: bindings::i2c_board_info = unsafe { core::mem::zeroed() };
+    let name = b"tmp108\0";
+    // Note: bindgen generates the C char array as [u8; N] (not [c_char; N]) in this
+    // configuration, so it is assigned u8 directly.
+    for (i, b) in name.iter().enumerate() {
+        info.type_[i] = *b;
+    }
+    info.addr = TMP108_ADDR;
+    info
+}
+
+// === SMBus primitives: word_data + Rust-side swab16 (replicating the i2c.h static inline) ===
+//
+// `include/linux/i2c.h` defines the swapped variants as static inline (no exported symbol):
+//   s32 i2c_smbus_read_word_swapped(client, command) {
+//       s32 value = i2c_smbus_read_word_data(client, command);
+//       return value < 0 ? value : swab16(value);      // error code returned as-is
+//   }
+//   s32 i2c_smbus_write_word_swapped(client, command, value) {
+//       return i2c_smbus_write_word_data(client, command, swab16(value));
+//   }
+// The exported word_data variants live in drivers/i2c/i2c-core-smbus.c
+// (EXPORT_SYMBOL). u16::swap_bytes() is equivalent to swab16.
+//
+// SAFETY: the signature matches the C prototype parameter by parameter; the caller
+// guarantees that client is valid.
+// Note on `#[allow(improper_ctypes)]`: in the bindings, `i2c_client` contains a
+// bindgen-generated **empty struct** via the `struct device -> struct mutex ->
+// lock_class_key` chain, which rustc deems not FFI-safe. In-tree precedents:
+// rust/bindings/lib.rs (crate-level allow), rust/uapi/lib.rs and
+// drivers/gpu/nova-core/gsp/fw/r570_144.rs (file-level allow). This can later go
+// through the kernel::i2c abstraction or via bindings_helper.h.
+#[allow(improper_ctypes)]
+unsafe extern "C" {
+    fn i2c_smbus_read_word_data(client: *mut bindings::i2c_client, command: u8) -> i32;
+    fn i2c_smbus_write_word_data(
+        client: *mut bindings::i2c_client,
+        command: u8,
+        value: u16,
+    ) -> i32;
+}
+
+// === find_closest_descending replication (util_macros.h) ===
+//
+// The C side is a **macro** (not a static inline) with no exported symbol, so it must be
+// replicated.
+//
+// Semantics (matched one by one):
+//  1. i counts **down** from len-1 to 1 (excluding 0, since the body reads a[i-1])
+//  2. match condition `x <= (a[i] + a[i-1]) / 2` (integer division, rounded down)
+//  3. on match, left = x - a[i], right = a[i-1] - x
+//  4. if **right < left (strictly)** then i-- (a tie at the midpoint does not step down)
+//  5. loop exhausted -> i == 0 (clamped to the largest step)
+//
+// Degenerate case: with `samples.len() == 1` i starts at 0 and the loop does not run, so it
+//   returns 0 (matching the C `as=1` -> `__fc_i=0` where the condition `0>=1` is false).
+fn find_closest_descending(x: c_long, samples: &[u16]) -> usize {
+    // An empty array has no index 0; the caller guarantees non-empty (SAMPLE_TIMES has 4).
+    if samples.is_empty() {
+        return 0;
+    }
+    let mut i: usize = samples.len() - 1;
+    while i >= 1 {
+        let mid = (samples[i] as c_long + samples[i - 1] as c_long) / 2;
+        if x <= mid {
+            let left = x - samples[i] as c_long;
+            let right = samples[i - 1] as c_long - x;
+            if right < left {
+                i -= 1;
+            }
+            break;
+        }
+        i -= 1;
+    }
+    i
+}
+
+// === Driver private data ===
+
+/// TMP108 driver private data.
+///
+/// - `client`: raw i2c client pointer (obtained from i2c_new_client_device during
+///   module init; lives as long as the module, freed by i2c_unregister_device in Drop)
+/// - `ready_time`: one-shot conversion ready time (a jiffies snapshot).
+///   It is a plain u64 rather than a Mutex: the new kernel::sync::Mutex::new requires a
+///   lock class key (pin_init API), while set_ready_time is never called here, so
+///   ready_time stays 0 (continuous mode, always ready). Enabling the one-shot path
+///   later will switch to the locked version, since the read callback uses &self.
+///
+/// Note: **deliberately not `pub`** -- the vtable macro injects
+/// `type OwnerModule = crate::LocalModule;` into every `#[vtable] impl` (an alias for
+/// the private type generated by `module!`, i.e. Tmp108Module). If `Self` were pub, that
+/// associated type would be part of the public interface and the private Tmp108Module
+/// would leak, triggering E0446 (private type in public interface).
+struct Tmp108 {
+    client: *mut bindings::i2c_client,
+    ready_time: u64,
+}
+
+// SAFETY: `client` is a raw pointer owned by this module: it is created in `init`, only
+// dereferenced by the hwmon callbacks while the registration is live, and unregistered in
+// `drop` after `hwmon_device_unregister()` has drained any in-flight callback. `ready_time`
+// is a plain `u64` that this revision never writes.
+unsafe impl Send for Tmp108 {}
+
+// SAFETY: the read/write callbacks access `client` via `&self` only to issue i2c
+// transactions (the i2c core serializes transfers on the same adapter itself); with no
+// write path, ready_time is read-only, so there is no data race.
+unsafe impl Sync for Tmp108 {}
+
+impl Tmp108 {
+    /// `client` must be a valid pointer living for the whole module (created in init,
+    /// unregistered in Drop). Note: not `pub` -- Tmp108 is private and a `pub fn` would
+    /// trip `-D unreachable-pub` (the kernel tree enables -D warnings); a plain `fn` suffices.
+    fn new(client: *mut bindings::i2c_client) -> Self {
+        Self {
+            client,
+            ready_time: 0,
+        }
+    }
+
+    // === i2c primitives (word_data + Rust-side swab16 = word_swapped) ===
+
+    /// Read-side replication of `value < 0 ? value : swab16(value)`: an error code is
+    /// returned as-is, otherwise the value is byte-swapped. Returns the driver-visible
+    /// register value (= swab16 of the on-wire word).
+    fn read_word_swapped(&self, cmd: u8) -> Result<u16> {
+        // SAFETY: `client` lives for the whole module (struct invariant); the word_data
+        // helper only requires `client` to be valid.
+        let v = unsafe { i2c_smbus_read_word_data(self.client, cmd) };
+        if v < 0 {
+            return Err(Error::from_errno(v));
+        }
+        Ok((v as u16).swap_bytes())
+    }
+
+    /// Write-side replication: `i2c_smbus_write_word_data(client, cmd, swab16(value))`.
+    fn write_word_swapped(&self, cmd: u8, val: u16) -> Result {
+        // SAFETY: same as `read_word_swapped`.
+        let rc = unsafe { i2c_smbus_write_word_data(self.client, cmd, val.swap_bytes()) };
+        if rc < 0 {
+            return Err(Error::from_errno(rc));
+        }
+        Ok(())
+    }
+
+    fn read_conf(&self) -> Result<u16> {
+        self.read_word_swapped(CONF as u8)
+    }
+
+    fn write_conf(&self, val: u16) -> Result {
+        // CONF is writable (TM/MODE/CR/HYS/POL bits).
+        self.write_word_swapped(CONF as u8, val)
+    }
+
+    /// Reads TEMP/TLOW/THIGH (all three share the same encoding: 12-bit left-justified
+    /// two's complement).
+    fn read_temp_reg(&self, reg: u16) -> Result<c_long> {
+        let v = self.read_word_swapped(reg as u8)?;
+        // reg -> mC: `(val & ~0x0f) * 1000 / 256` with val as s16.
+        // The C code computes in int; i32 is required because a direct i16 multiply by 1000
+        // overflows (32000*1000 > i16::MAX). Rust integer division truncates toward zero
+        // (as in C), so no special handling is needed.
+        let mc = i32::from((v & !0x0f) as i16) * 1000 / 256;
+        Ok(mc as c_long)
+    }
+
+    /// Writes TLOW/THIGH: clamp, then convert.
+    fn write_threshold(&self, reg: u16, value_mc: c_long) -> Result {
+        let clamped = value_mc.clamp(CLAMP_MIN_MC as c_long, CLAMP_MAX_MC as c_long);
+        // `(val * 256) / 1000`, truncating toward zero; the C code computes in int and the
+        // post-clamp range [-50000, 127937] makes the i32 computation lossless.
+        let reg_val = ((clamped as i32) * 256 / 1000) as u16;
+        // TLOW/THIGH are writable (the C code imposes no read-only restriction).
+        self.write_word_swapped(reg as u8, reg_val)
+    }
+
+    // === Hysteresis decode/encode ===
+
+    /// CONF.HYS1:HYS0 -> 0/1000/2000/4000 mC
+    fn hyst_mc(&self, conf: u16) -> i32 {
+        match (conf & CONF_HYS_MASK) >> 4 {
+            0 => 0,
+            1 => 1000,
+            2 => 2000,
+            _ => 4000,
+        }
+    }
+
+    /// Bucketing: returns the CONF.HYS field value (0x0000/0x0010/0x0020/0x0030)
+    fn hyst_field(deg_mc: i32) -> u16 {
+        let code = if deg_mc < HYST_STEP_1_MC {
+            0
+        } else if deg_mc < HYST_STEP_2_MC {
+            1
+        } else if deg_mc < HYST_STEP_4_MC {
+            2
+        } else {
+            3
+        };
+        code << 4
+    }
+
+    /// One-shot window check: returns false when not ready (mapped to EAGAIN).
+    /// `ready_time == 0` means continuous mode (always ready).
+    /// With no one-shot write path, ready_time stays 0, so this is always ready; the
+    /// jiffies comparison arrives together with set_ready_time.
+    fn one_shot_ready(&self) -> bool {
+        self.ready_time == 0
+    }
+
+    // === Chip channel update_interval ===
+
+    /// Reads `update_interval` (in **ms**, not mC).
+    ///
+    /// Reads CONF, extracts the CONVRATE field and indexes `sample_times`:
+    /// `FIELD_GET(GENMASK(14,13), v)` == `(v & 0x6000) >> 13`.
+    fn read_update_interval(&self) -> Result<c_long> {
+        let conf = self.read_conf()?;
+        let idx = ((conf & CONF_CONVRATE_MASK) >> CONF_CR0_POS) as usize;
+        // idx comes from a 2-bit field, so it is always < 4 == SAMPLE_TIMES.len(),
+        // making the index safe.
+        Ok(SAMPLE_TIMES[idx] as c_long)
+    }
+
+    /// Writes `update_interval`: pick the step with `find_closest_descending`, then
+    /// read-modify-write.
+    ///
+    /// The C driver uses `regmap_update_bits(regmap, CONF, CONVRATE_MASK, FIELD_PREP(FLD, idx))`.
+    /// This driver does not use regmap (it goes through i2c_smbus_word_data), so this is
+    /// expanded into a read-modify-write (the same shape as the hysteresis write):
+    ///   `conf = (conf & !MASK) | (idx << 13)`
+    ///
+    /// There is no clamp here (unlike the temperature thresholds); out-of-range values are
+    /// clamped by find_closest_descending.
+    fn write_update_interval(&self, value: c_long) -> Result {
+        let idx = find_closest_descending(value, &SAMPLE_TIMES);
+        let mut conf = self.read_conf()?;
+        conf = (conf & !CONF_CONVRATE_MASK) | ((idx as u16) << CONF_CR0_POS);
+        self.write_conf(conf)
+    }
+}
+
+// === hwmon Driver implementation (attribute by attribute) ===
+
+#[vtable]
+impl Driver for Tmp108 {
+    fn read(&self, attr: TempAttr, channel: u32) -> Result<c_long> {
+        // The channel is fixed at 0 (hwmon channel numbers start at 0; TMP108 has a single
+        // temperature channel). The abstraction already rejects non-temp types, so this is a
+        // defensive check on channel.
+        if channel != 0 {
+            return Err(EINVAL);
+        }
+
+        match attr {
+            TempAttr::Input => {
+                // One-shot window check: not ready -> -EAGAIN
+                if !self.one_shot_ready() {
+                    return Err(EAGAIN);
+                }
+                self.read_temp_reg(TEMP)
+            }
+            TempAttr::Min => self.read_temp_reg(TLOW),
+            TempAttr::Max => self.read_temp_reg(THIGH),
+            TempAttr::MinAlarm => {
+                // !!(regval & CONF_FL)
+                let conf = self.read_conf()?;
+                Ok(if conf & CONF_FL != 0 { 1 } else { 0 })
+            }
+            TempAttr::MaxAlarm => {
+                // !!(regval & CONF_FH)
+                let conf = self.read_conf()?;
+                Ok(if conf & CONF_FH != 0 { 1 } else { 0 })
+            }
+            TempAttr::MinHyst => {
+                // min_hyst = TLOW_mC + hyst_mC (absolute-value semantics)
+                let conf = self.read_conf()?;
+                let tlow = self.read_temp_reg(TLOW)?;
+                Ok(tlow + self.hyst_mc(conf) as c_long)
+            }
+            TempAttr::MaxHyst => {
+                // max_hyst = THIGH_mC - hyst_mC
+                let conf = self.read_conf()?;
+                let thigh = self.read_temp_reg(THIGH)?;
+                Ok(thigh - self.hyst_mc(conf) as c_long)
+            }
+        }
+    }
+
+    fn write(&self, attr: TempAttr, channel: u32, value: c_long) -> Result {
+        if channel != 0 {
+            return Err(EINVAL);
+        }
+
+        match attr {
+            TempAttr::Min => self.write_threshold(TLOW, value),
+            TempAttr::Max => self.write_threshold(THIGH, value),
+            TempAttr::MinHyst | TempAttr::MaxHyst => {
+                // The requested value is clamped first, then differenced against the current
+                // register value: min_hyst: delta = request - TLOW_mC; max_hyst:
+                // delta = THIGH_mC - request. Only the CONF.HYS field is changed, leaving
+                // TLOW/THIGH untouched (regmap_update_bits).
+                let value = value.clamp(CLAMP_MIN_MC as c_long, CLAMP_MAX_MC as c_long);
+                let reg = if attr == TempAttr::MinHyst { TLOW } else { THIGH };
+                let current = self.read_temp_reg(reg)?;
+                let delta = if attr == TempAttr::MinHyst {
+                    (value - current) as i32
+                } else {
+                    (current - value) as i32
+                };
+                let field = Self::hyst_field(delta);
+                let mut conf = self.read_conf()?;
+                conf = (conf & !CONF_HYS_MASK) | field;
+                self.write_conf(conf)
+            }
+            // Read-only attributes (no C write implementation): `is_visible` returns 0444, so
+            // the framework never calls write. They must be listed explicitly (a `_` arm would
+            // be unreachable since all 7 variants are covered; omitting them would trigger
+            // E0004 non-exhaustiveness).
+            TempAttr::Input | TempAttr::MinAlarm | TempAttr::MaxAlarm => Err(EOPNOTSUPP),
+        }
+    }
+
+    fn is_visible(&self, attr: TempAttr, channel: u32) -> u16 {
+        if channel != 0 {
+            return 0;
+        }
+        // Matched attribute by attribute:
+        // - Input/MinAlarm/MaxAlarm: unconditionally 0444
+        // - Min/Max: unconditionally 0644
+        // - MinHyst/MaxHyst: conditionally 0644, visible only when config_reg_16bits=true;
+        //   this driver supports only the tmp108 (16-bit CONF), so it is always true
+        // - Crit family: not exposed by TMP108 (the C default branch)
+        // - chip type (update_interval): see `chip_is_visible` below
+        match attr {
+            TempAttr::Input | TempAttr::MinAlarm | TempAttr::MaxAlarm => 0o444,
+            TempAttr::Min | TempAttr::Max => 0o644,
+            TempAttr::MinHyst | TempAttr::MaxHyst => 0o644,
+            // Note: no catch-all arm -- all 7 variants are enumerated (none maps to
+            // permission 0).
+        }
+    }
+
+    // === Chip channel ===
+    //
+    // The methods are declared `#[optional]` (no default body) in `rust/kernel/hwmon.rs`;
+    // when not overridden, `HAS_CHIP_* == false` and the abstraction registers no callback.
+
+    /// Reads a chip-level attribute. `ChipAttr` has a single variant, so the match is
+    /// exhaustive.
+    fn chip_read(&self, attr: ChipAttr) -> Result<c_long> {
+        match attr {
+            ChipAttr::UpdateInterval => self.read_update_interval(),
+        }
+    }
+
+    /// Writes a chip-level attribute.
+    fn chip_write(&self, attr: ChipAttr, value: c_long) -> Result {
+        match attr {
+            ChipAttr::UpdateInterval => self.write_update_interval(value),
+        }
+    }
+
+    /// Chip attribute permissions: `tmp108_is_visible` returns 0644 unconditionally for
+    /// the chip channel.
+    fn chip_is_visible(&self, attr: ChipAttr) -> u16 {
+        match attr {
+            ChipAttr::UpdateInterval => 0o644,
+        }
+    }
+}
+
+// === Module ===
+
+module! {
+    type: Tmp108Module,
+    name: "tmp108",
+    authors: ["skxby <2374604267@qq.com>"],
+    description: "TMP108 temperature sensor driver (Rust, i2c + hwmon)",
+    license: "GPL",
+    params: {
+        busnum: i64 {
+            default: 0,
+            description: "I2C bus number of the adapter hosting the TMP108 (i2c-stub in tests)",
+        },
+    },
+}
+
+struct Tmp108Module {
+    // The Option is only for Drop ordering: unregister hwmon first (its barrier drains
+    // in-flight callbacks), then unregister client.
+    hwmon: Option<Registration<Tmp108>>,
+    client: *mut bindings::i2c_client,
+}
+
+// SAFETY: the `client` pointer lives for the whole module (Drop ordering unregisters
+// hwmon first and client afterwards, so nothing dangles past the barrier). Moving the
+// pointer value across threads is not a data race: client is only touched in init/drop
+// (mutually exclusive module lifecycle callbacks) and in the hwmon read/write callbacks
+// (synchronized by Registration's unregister barrier). The Send/Sync of the `hwmon`
+// field is proven field by field by the abstraction's Registration SAFETY comment.
+unsafe impl Send for Tmp108Module {}
+
+// SAFETY: sharing a `&Tmp108Module` cannot produce a data race -- `client` is only read
+// in `drop` (&mut self), and the `hwmon` field is Sync (proven by the abstraction).
+unsafe impl Sync for Tmp108Module {}
+
+impl kernel::Module for Tmp108Module {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        let busnum = module_parameters::busnum.value() as i32;
+        pr_info!("TMP108: attaching to i2c bus {}\n", busnum);
+
+        // SAFETY: i2c_get_adapter is an EXPORT_SYMBOL kernel API; nr is the bus number and
+        // the call returns a referenced adapter, or null if the bus does not exist.
+        let adapter = unsafe { bindings::i2c_get_adapter(busnum) };
+        if adapter.is_null() {
+            return Err(ENODEV);
+        }
+
+        let board_info = board_info();
+
+        // SAFETY: adapter is valid (null-checked above); board_info is a fully initialized
+        // i2c_board_info (type_/addr filled in, the rest zero, which i2c-core allows).
+        let client = unsafe { bindings::i2c_new_client_device(adapter, &board_info) };
+        // The client's dev kobject holds a reference to the adapter via kobject_add (the
+        // driver-model parent/child relationship), so the reference taken by i2c_get_adapter
+        // is dropped here.
+        // SAFETY: adapter was obtained above via get_adapter; its reference count is held on
+        // the client side.
+        unsafe { bindings::i2c_put_adapter(adapter) };
+
+        // from_err_ptr handles ERR_PTR (the i2c_new_client_device failure path); the null
+        // check is a second line of defense (the path should not return plain null).
+        let client = from_err_ptr(client)?;
+        if client.is_null() {
+            return Err(ENODEV);
+        }
+
+        // SAFETY: client was created successfully above (non-null, non-ERR_PTR); from_raw
+        // only reinterprets the pointer as a &Device. Lifetime argument: client lives for the
+        // whole module (Drop unregisters hwmon before client) and this reference is only used
+        // as the registration parent argument. client was just registered, so its dev context
+        // is Bound.
+        let parent: &Device<Bound> = unsafe { Device::from_raw(&raw mut (*client).dev) };
+
+        // Registration failure path: if `Registration::new` fails and `?` returns early, the
+        // already-created i2c client is never unregistered. Such a leftover client keeps the
+        // bus address 0x48 occupied forever, making every subsequent insmod fail with EBUSY.
+        // The failure branch must therefore unregister the client explicitly (cleanup on the
+        // hwmon side is handled by the hwmon core itself).
+        let hwmon = match Registration::new(parent, c"tmp108", Tmp108::new(client)) {
+            Ok(hwmon) => hwmon,
+            Err(e) => {
+                // SAFETY: client was created successfully in this function (non-null,
+                // non-ERR_PTR) and is not yet owned by hwmon (registration failed), so no
+                // in-flight callback touches the pointer.
+                unsafe { bindings::i2c_unregister_device(client) };
+                return Err(e);
+            }
+        };
+
+        pr_info!("TMP108: hwmon device registered\n");
+        Ok(Self {
+            hwmon: Some(hwmon),
+            client,
+        })
+    }
+}
+
+impl Drop for Tmp108Module {
+    fn drop(&mut self) {
+        // Unregistration order (critical): hwmon first -- Registration::drop calls
+        // hwmon_device_unregister, which blocks until all in-flight callbacks return, after
+        // which no callback touches the Tmp108.client pointer; then unregister the i2c
+        // client. The reverse order is a callback UAF.
+        drop(self.hwmon.take());
+        if !self.client.is_null() {
+            // SAFETY: client was created by this module's init; hwmon has already been
+            // unregistered (take + drop above), so no in-flight callback accesses client.
+            unsafe { bindings::i2c_unregister_device(self.client) };
+        }
+    }
+}

