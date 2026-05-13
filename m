Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19711221275
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 23:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715270; cv=none; b=KNMQ8n0J8gxCEapqNKVMZFL29IFPWRNwSVBIIDBEDUlJ4wr2BLWCHD4BuToCCVFv+mdeC2uwz5pTGMyNoZs/OrrKzqYQ55IRK/9r+GhrSj2V5JlodhfHHg2sm+7ezgBWF03epmWs0aBFm+fQKtR8i+J8ReglgeaRAEFZZ0QF278=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715270; c=relaxed/simple;
	bh=zWv+mSLB0MaPAxGtYmjU44KChrpNOFEwNZSHD6e0jjA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rCag4YWUZWp+RwW0WE+EX+9C2MxzOT84Vy+9p5EDKVtj3vco7nE5BgILFHWtKUUFR3eLKfqBAgzYrG6cOW8XzNhHOojQj4K7ecJgHwL3b9shVTM5saUS6aYfTwwhPoDxcJYdPiZsZaCw+FqW9mS4RxCfLQ75vGqyK38wq8EJ4Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQOEiaJy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQOEiaJy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF1AC19425;
	Wed, 13 May 2026 23:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778715269;
	bh=zWv+mSLB0MaPAxGtYmjU44KChrpNOFEwNZSHD6e0jjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jQOEiaJyMA7EuvZnIurgktsoH6LRbzsFBj4eGLOkwvQGrfOztC2/Cs83NahyHIqRG
	 D4xJK31s2JiQ9oNxON+ECm1JejbL0rYDSoKFa8Y7xCCKnoTI9TRKG1t2vSg1sGQqcn
	 5slKzKh5zjV6+69oN+8CUMEUnZIsBCitl2UV90jY3Ey+Zi0KHTH8PQY6Xuf4lH31gb
	 SYInKmGee3V7w023OssIpGv1blBJi28J/hMeiL0GFSZLKUGCha4EgaHiM2kRlcSt91
	 5oRR61SmLLd/0foSivbkJjJll8lIJvBlRu1xSZ0cFIloMmMj2t9jFM8U4uS3H/bWQC
	 QxjyK5+9TaAKw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] rust: hwmon: add basic hwmon abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: Donjuanplatinum <donplat@barrensea.org>
Cc: ojeda@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260512155747.10136-1-donplat@barrensea.org>
References: <20260512155747.10136-1-donplat@barrensea.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 23:34:29 +0000
Message-Id: <20260513233429.8FF1AC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Use-After-Free via `name` sysfs attribute.
- [Medium] Bypassing the mandatory `pin_init!` safety framework for pinned =
initialization.
- [Low] Missing `#[inline]` annotations on small abstraction helpers.
- [Low] Misspelled author name in module metadata.
--

commit c36781b9829b25d8c4099a3b3ad9cfa1c367592f
Author: Donjuanplatinum <donplat@barrensea.org>

rust: hwmon: add basic hwmon abstractions

Add a minimal Rust abstraction for the Hardware Monitoring subsystem.
This supports registering a single temperature sensor with the temp1_input
attribute.

> diff --git a/rust/kernel/hwmon.rs b/rust/kernel/hwmon.rs
> new file mode 100644
> index 0000000000000..5697a1a0d6c29
> --- /dev/null
> +++ b/rust/kernel/hwmon.rs

[ ... ]

> +impl TryFrom<u32> for SensorType {
> +    type Error =3D Error;
> +
> +    fn try_from(value: u32) -> Result<Self> {

This isn't a bug, but should this small abstraction helper be annotated with
#[inline] to match the Rust subsystem guidelines?

[ ... ]

> +impl TryFrom<u32> for TempAttr {
> +    type Error =3D Error;
> +
> +    fn try_from(value: u32) -> Result<Self> {

This isn't a bug, but should this helper also be annotated with #[inline]?

[ ... ]

> +impl<T: Driver> HwmonInner<T> {
> +    /// Returns a placeholder with all pointer fields set to null. The r=
eturned structure is
> +    /// safe to drop =E2=80=94 no dynamic resources are held before regi=
stration completes.
> +    fn new_placeholder(driver: T) -> Self {

This isn't a bug, but could this abstraction function also be annotated
with #[inline]?

[ ... ]

> +impl<T: Driver> Registration<T> {
> +    /// Registers a new hwmon device.
> +    ///
> +    /// The device is registered as a child of parent. name must not con=
tain characters
> +    /// rejected by hwmon_is_bad_char (hyphens, spaces, asterisks).
> +    pub fn new(parent: &Device, name: &CStr, data: T) -> Result<Self> {
> +        let mut boxed =3D KBox::new(HwmonInner::new_placeholder(data), G=
FP_KERNEL)?;

Is it possible to use the try_pin_init! framework here instead of manually
allocating a KBox and later sealing it with Pin::new_unchecked?=20

The subsystem documentation states that try_pin_init! should be used to
initialize structs that require pinning.

[ ... ]

> +        // SAFETY: chip_info and all nested pointers target memory withi=
n the same
> +        // allocation, which remains valid until hwmon_device_unregister=
 in Drop.
> +        // parent.as_raw() and name.as_char_ptr() are valid. The name is=
 copied by
> +        // the kernel (via dev_set_name -> kvasprintf_const), so no life=
time issue.
> +        let hwmon_dev =3D from_err_ptr(unsafe {
> +            bindings::hwmon_device_register_with_info(
> +                parent.as_raw(),
> +                name.as_char_ptr(),

The safety comment states the name is copied by the kernel via dev_set_name,
but does the hwmon core use this pointer directly for the name sysfs
attribute rather than just the kobject directory name?

If hwmon_device_register_with_info() stores the raw pointer directly in
hwdev->name without copying it, and this function accepts a temporary &CStr
that can be dropped immediately after registration, will reading
/sys/class/hwmon/hwmonX/name from userspace dereference a freed pointer?

Could this API require a &'static CStr, or securely allocate and copy the
string to prevent a use-after-free?

> +                drvdata,
> +                &raw const (*inner_ptr).chip_info,
> +                core::ptr::null_mut(),
> +            )
> +        })?;

[ ... ]

> diff --git a/samples/rust/rust_driver_hwmon.rs b/samples/rust/rust_driver=
_hwmon.rs
> new file mode 100644
> index 0000000000000..3362de9246e09
> --- /dev/null
> +++ b/samples/rust/rust_driver_hwmon.rs

[ ... ]

> +module! {
> +    type: SampleModule,
> +    name: "rust_hwmon_driver",
> +    authors: ["DonjuanPlatium"],

This isn't a bug, but there is a typo in the author name (DonjuanPlatium
instead of DonjuanPlatinum).

> +    description: "Rust hwmon device sample",
> +    license: "GPL",
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512155747.1013=
6-1-donplat@barrensea.org?part=3D1
