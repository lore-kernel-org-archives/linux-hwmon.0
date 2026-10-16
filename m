Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48475419FC5
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 07:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135997; cv=none; b=CziQzet5Y+OCS5EGtSCWs321V0ZtUAMWtYE4uVYqR3LlbzDTFhmx7DPOs1HbC6o/dTZS8Whe+e6vb1aBxnw0pX9lIKfnHLHfIvNYyMerLzt+rOJYi3ZHrEicKTEHPdJwdqtGNxLwn8fLUETUqVntqgQ2Ie6uQWhwnBTNi6ZE4a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135997; c=relaxed/simple;
	bh=naz0B5V/6SddpZgX2SYN/55XvoQduRcEbrniiKH0RvU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YXzQNK8bTOjyJRA9JFflNv5+PqhspmrWEeQQwEX9eLsII9C2yIlJn1RQzIBJQ6UyucYEJI2/t61jOExgrCixUxdxPv3yH8lb7yNDrP1Z76h6wiimrhm8thNM55Y0pTok61xBHm2pj8j4Ty1DUePpDL0djmLsEKORaWzgl9r0V+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJzUP3nW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJzUP3nW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF061F000C4;
	Fri, 16 Oct 2026 07:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792135995;
	bh=3iC8YO/QVk2Pbvkjuw142gZeQ8FTD+/dtE7876zaFX4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TJzUP3nWZ12Ny0KqdW6AnT1sIaOCqE47M5nj+GAo+hYEfPLo5FUR2y3Widx7DAsvR
	 hDvND4DOhWnrAMNMKzYBcAUz4Lb1Cz05jpQ1vrp8ILAU6TsH5Hb6ja66iJnWb4Lz3L
	 rLjY8C5sZi4dx1SsSCiTxhzYWwH3oK5cos0YLSUsN9UlYE41qNS5+5lGR+dH5d7Afi
	 zD+Y7K9PqQeE1da+xF9iZDiV+R3xEltCEbdXwMR4CzI8HfgJ+U8VC3cqyWEie4NVDm
	 l9jj4z7td7ng1TdSRuSwt9EKqZ2Ma98Mm575ra+tmF9MOkX2z+9w7a6xJU++YrCqAV
	 anPzyAFhM2fKQ==
Message-ID: <sashiko-outbox-173934@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] rust: hwmon: add hwmon abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: skxby <2374604267@qq.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_95E7F9B5CE294CA4027A0CD4C550B454050A@qq.com>
References: <179213545522.40444.8748988877722946371@qq.com>
 <tencent_95E7F9B5CE294CA4027A0CD4C550B454050A@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 07:33:15 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] hwmon: use-after-free of hwdev->name due to unconstrained &CStr li=
fetime
- [High] hwmon: out-of-bounds read due to missing null-terminator in chip_c=
onfig
- [High] hwmon: linker error for drivers omitting #[optional] chip_read/wri=
te
- [Medium] hwmon: missing hwmon_lock() API and incorrect locking documentat=
ion
- [Medium] hwmon: manual pointer wiring bypasses required pin-init API
- [Low] hwmon: abstraction limits drivers to a single temperature channel
- [Low] hwmon: missing #[inline] attribute on Registration drop method
--

commit a2d95b04547e27fa736c176ee2cb6a3c7255a3eb
Author: skxby <2374604267@qq.com>
Date:   Fri Oct 16 15:12:27 2026 +0800

rust: hwmon: add hwmon abstractions
   =20
Add Rust abstractions for the hwmon subsystem, supporting temp[1-*]
attributes and chip-level attributes. Registration owns its inner state
and uses a Driver trait for callbacks.

Link: https://lore.kernel.org/all/20260512155747.10136-1-donplat@barrensea.=
org/

> diff --git a/rust/kernel/hwmon.rs b/rust/kernel/hwmon.rs
> new file mode 100644
> index 0000000000000..d7e3fd683b862
> --- /dev/null
> +++ b/rust/kernel/hwmon.rs
[ ... ]
> +/// The hwmon driver trait.
> +///
> +/// # Concurrency and Driver Responsibilities
> +///
> +/// The hwmon C core provides **no internal locking** for attribute acce=
ss. When user-space
                                     ^^^^^^^^^^^^^^^^^^^^^^
[Severity: Medium]
This isn't a bug, but is this statement accurate?

The documentation incorrectly claims that the 'hwmon C core provides no
internal locking for attribute access'. The C core uses a per-device mutex
(guard(mutex)(&hwdev->lock)) during sysfs attribute reads and writes.

Furthermore, the hwmon subsystem guidelines explicitly state that drivers
should use hwmon_lock() and hwmon_unlock() to implement locking required
for interrupt handling. This abstraction fails to expose or wrap these
functions, making it impossible for Rust drivers to comply with this
official rule.

> +/// reads or writes `/sys/class/hwmon/hwmon*/temp*_*`, the core directly=
 invokes the
> +/// registered callbacks with a **shared `&self` reference** to `HwmonIn=
ner<T>`.
[ ... ]
> +    unsafe extern "C" fn read_callback(
> +        dev: *mut bindings::device,
> +        type_: u32,
> +        attr: u32,
> +        channel: c_int,
> +        val: *mut c_long,
> +    ) -> c_int {
> +        from_result(|| {
[ ... ]
> +            let result =3D match SensorType::try_from(type_)? {
> +                SensorType::Chip =3D> T::chip_read(&inner.driver, ChipAt=
tr::try_from(attr)?)?,
                                       ^^^^^^^^^^^
[Severity: High]
Does this code cause a compilation failure for drivers that do not implement
the optional chip methods?

The Driver trait marks chip_read and chip_write as #[optional]. The
#[vtable] macro replaces missing optional methods with a build_error!()
call. Here, the calls to T::chip_read and T::chip_write are unconditional
within the dynamically evaluated SensorType::Chip branch.

Because the compiler cannot prove this branch is dead at compile time, the
build_error!() call is retained in the binary, causing a fatal linker error
for any driver that chooses not to implement these methods.

Should the calls be guarded by if T::HAS_CHIP_READ and
if T::HAS_CHIP_WRITE?

> +                // C core guarantees `channel >=3D 0`.
> +                SensorType::Temp =3D> {
> +                    T::read(&inner.driver, TempAttr::try_from(attr)?, ch=
annel as u32)?
> +                }
> +            };
[ ... ]
> +    fn new_placeholder(driver: T) -> Self {
> +        // A driver that exposes no chip attribute must not advertise th=
e chip channel
> +        // either: leaving `chip_config` zeroed makes the channel carry =
no attributes, and
> +        // `is_visible` would not be consulted for it in the first place.
> +        let chip_config =3D if T::HAS_CHIP_IS_VISIBLE {
> +            [CHIP_ATTR_MASK]
             ^^^^^^^^^^^^^^^^
[Severity: High]
Can this out-of-bounds read adjacent memory when the C core reads the
configuration?

The C hwmon core strictly requires the hwmon_channel_info.config array to
be null-terminated (ending with a 0). Here, chip_config is defined as
[u32; 1] and initialized to [CHIP_ATTR_MASK]. It lacks a trailing 0
terminator.

When hwmon_device_register_with_info reads the channel configuration, it
will fail to stop at the end of chip_config and read past the array bounds
into adjacent memory, which can cause the C core to misinterpret memory as
attribute masks.

> +        } else {
> +            [0]
> +        };
> +
> +        Self {
> +            driver,
> +            ops: bindings::hwmon_ops {
> +                is_visible: Some(Adapter::<T>::is_visible_callback),
> +                visible: 0,
> +                read: Some(Adapter::<T>::read_callback),
> +                read_string: None,
> +                write: Some(Adapter::<T>::write_callback),
> +            },
> +            chip_config,
> +            temp_config: [TEMP_ATTR_MASK, 0],
                            ^^^^^^^^^^^^^^^^^
[Severity: Low]
Does this hardcoded array strictly limit the abstraction to a single
temperature channel?

The commit message asserts that the abstraction supports registering
temperature sensors with the full standard temp[1-*] attribute set.
However, this single configuration mask means the C core will only create
attributes for temp1_* and will never query channel > 0, preventing drivers
from registering multiple temperature sensors.

> +            chip_channel: bindings::hwmon_channel_info {
> +                type_: 0,
> +                config: core::ptr::null(),
> +            },
[ ... ]
> +    pub fn new(parent: &Device<Bound>, name: &CStr, data: T) -> Result<S=
elf> {
> +        let mut boxed =3D KBox::new(HwmonInner::new_placeholder(data), G=
FP_KERNEL)?;
> +
> +        // Wire self-referential pointers before pinning. We obtain a mu=
table raw pointer
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[Severity: Medium]
Does this manual pointer wiring bypass the required pin-init API?

The Rust subsystem guidelines require that try_pin_init! or pin_init! be
used to initialize structs that require pinning. The abstraction bypasses
this safe pin-init framework by allocating a KBox, acquiring a raw pointer,
mutating fields unsafely to wire self-referential pointers, and manually
calling Pin::new_unchecked.

> +        // from the uniquely-owned `KBox` -- no intermediate `&mut` refe=
rence is created,
> +        // so no aliasing rules are violated.
> +        let inner_ptr: *mut HwmonInner<T> =3D &raw mut *boxed;
[ ... ]
> +        // SAFETY: `chip_info` and all nested pointers target memory wit=
hin the same
> +        // allocation, which remains valid until `hwmon_device_unregiste=
r` in `Drop`.
> +        // `parent.as_raw()` and `name.as_char_ptr()` are valid. The nam=
e is copied by
> +        // the kernel (via `dev_set_name` -> `kvasprintf_const`), so no =
lifetime issue.
> +        let hwmon_dev =3D from_err_ptr(unsafe {
> +            bindings::hwmon_device_register_with_info(
> +                parent.as_raw(),
> +                name.as_char_ptr(),
                 ^^^^^^^^^^^^^^^^^^
[Severity: High]
Can this cause a use-after-free of hwdev->name?

The Registration::new function accepts a name: &CStr parameter without a
lifetime constraint tying it to the Registration object. The C core stores
this pointer directly in hwdev->name (which is returned by the sysfs
name_show attribute) without copying the string.

If a caller passes a temporary string (e.g., a short-lived CString), the
string will be freed after registration. When userspace later reads
/sys/class/hwmon/hwmon*/name, the C core will dereference the freed memory.

> +                drvdata,
> +                &raw const (*inner_ptr).chip_info,
> +                core::ptr::null_mut(),
> +            )
> +        })?;
> +
> +        Ok(Self { hwmon_dev, inner })
> +    }
> +}
> +
> +impl<T: Driver> Drop for Registration<T> {
> +    fn drop(&mut self) {
       ^^^^^^^
[Severity: Low]
This isn't a bug, but should this method have an #[inline] attribute?

According to the Rust subsystem guidelines, small functions or functions
forwarding to a C binding call in abstractions should be annotated with
#[inline]. This method forwards directly to bindings::hwmon_device_unregist=
er
but lacks this required annotation.

> +        // SAFETY: `hwmon_dev` was returned by a successful registration=
. This call waits for
> +        // all in-flight callbacks before returning.
> +        unsafe { bindings::hwmon_device_unregister(self.hwmon_dev) };
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_95E7F9B5CE2=
94CA4027A0CD4C550B454050A@qq.com?part=3D1
