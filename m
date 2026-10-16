Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC1B41DEF4;
	Fri, 16 Oct 2026 07:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135494; cv=none; b=ZP3gH8PHe28ta6/PifBZk5B8XTDTmg95YP5B/b3IvsoZjgo+iMaBvwqYh+X7LW0nSyskQ4IyLKPHt/sDRM0Xxk0T+UZ1jIXzzefBvm7SweJNL9UwjdnVoKSF9FyelKSfLztAguc8fe1uoPG+yuebiWZucljGFIiuURR++zSnvT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135494; c=relaxed/simple;
	bh=cvrGbmZH6DQrmf8GrZ7C+XpiH8J+M3O0XMergNvOTB0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bxNGwGKOFH2L5XM260h/Y16DFOapFfzU6zjx1SKxw0VmXSksya+4FYAOp+4e5VzwimjlaDU7C+I1PswnCl4luTdYY9mNzAqvLMRx/KzOIhLznwPtVm3tWpuYNtHj15+4Jg2BFV4MWHSS7ZylKko2dCm0hxduvucjebIRc/dlFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=KZewl/Bw; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="KZewl/Bw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792135465; bh=EQfea610ZCPV9X5LfzvpHLBmDIAceLkugL2AgDpwMgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KZewl/BwLwzafVrKILcd0xreTHLnK+sAcn/Znnzkd5/zNbhfZ1IQBWWPQcwca83Ka
	 ZCDXvKGlss5fsX9oT1b+4xWesHOeBrByHCjwXzuPsYbNJZQynPr00w53hcOH7sBKTO
	 6n/XmI4F6xviIcvpCbMJL2R84tvj4e4SlH0Jm6Pk=
Received: from [172.24.48.1] ([2409:8951:a22:b25:d1a1:62d3:eb69:e679])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 6171AA01; Fri, 16 Oct 2026 15:24:23 +0800
X-QQ-mid: xmsmtpt1792135463tz4on925x
Message-ID: <tencent_576573331343805F032731492D63C12D7E08@qq.com>
X-QQ-XMAILINFO: MMiYYMZfA8EXVYAFw0VuapiIPwNd82PETT7MpDL+DK8nwabLk9O4pakOlCCxrI
	 7Nipp9h44cWRotIS7ctnDt7RpOY0kZffYJc6DCI3drw0B0+JZZ1GJgu8o1kRPsfawNZmne9ITLeX
	 54M1o2EKpYFF7NOuw8P4YuUm6sdMvYo6MklCNe0zMHKgJc5SpHqz+OqcizAIuoGvP/nPQVgzUNOX
	 KIA2tOHAkQMPMyYllKQbChnJUeDIMfMkpA/g81HIjyJ2V3SsxTB19HkWgw3DMkxwpYh/EIHeM2Qr
	 PC4LnE9d1kUfpTp8kF4kXpr3DVW72S7FesvLNBe9jvsS4wiJCCsLb2UOiiF3orQeBBbivqZlAeKl
	 dtTk6RmAm4kLr8lYaSqvfyyZpRIAa7DY274o0DqbpZ1vLIUP5iUHQdpR2De0NMRsTYg3y/0JVaxL
	 yQ6rrpmG0J+5zB7qRL3+Fi7fcyLChqiETFQIIAf2KnLi1duLo9J6Toqrwk9XOq28z/RVM61PpMvX
	 l+B/lYlDkvd4tlRUH+wmGSNyd4nEVaVkYqBItzQEzpiM6TDo9IkHf9h02c4IZZE85py3LPsNKY2h
	 QIrVrBsSbW6m8avJrmUsk65Sr+Z3vbrwSuRKUo8poXBMGRGbAYWBGOmDnhPmfziuQGs9k8LNwdtX
	 3xLRYWKeiGQRKFu8ihgXUhag5Y0J+640vDfl19qgYltwlNVqtHslNpDyHF3Pq/VQGYaCyeHAnmWL
	 BD2CYuu7WSYMNwCj++HogJ8xs3UokImt2rNtKW3iOrbrM//Y42TPfOXUePNAv8UY5DS5J7iAKn77
	 jW1fvoBLeL0GBoqbA+A7imG/fcFg1FEihH91Tig2yHlFPPjXclVTt5UrTJzL0rwpBne5Pc9/9Wmv
	 trTYwOuiKOd1Sy+y/N4/pI/oUOLOWldThwNXLDoeIfD+3azIGDndYBjmi3KWoyWhc0lYlbFmXSA7
	 MtyGKIR6T4brq2o9OZ/f8v4EAsm4ditvZ/tYrLAdPcJtbrS0yhjW9qtaO7LjZ/se18tC9nOWU=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: skxby <2374604267@qq.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Donjuanplatinum <donplat@barrensea.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] rust: hwmon: rework hwmon abstractions, add TMP108 driver
Date: Fri, 16 Oct 2026 15:24:15 +0800
X-OQ-MSGID: <179213545522.40444.8748988877722946371@qq.com>
In-Reply-To: <9c2fa543-525a-4e43-9f73-7caf13b98039@roeck-us.net>
References: <20260512155747.10136-1-donplat@barrensea.org>
 <9c2fa543-525a-4e43-9f73-7caf13b98039@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Guenter,

[1] Positioning

This series follows up on Donjuanplatinum's RFC [1], which proposed basic
Rust abstractions for the hwmon subsystem. Your reply [2] noted that Rust
support in hwmon would have to wait for someone else to pick up
maintainership, and the thread has been quiet since. I am not re-litigating
that decision here. I have taken the proposed abstractions, reworked them
against the current rust tree, and written a real driver on top of them
(TMP108, mirroring drivers/hwmon/tmp108.c). I am posting the result so the
work itself - the shape of the abstraction and the driver built on it - can
be looked at on its own merits, whenever and by whoever takes the
maintainership question up.

[2] What this series contains

  Patch 1 - rust: hwmon: add hwmon abstractions (rework of the RFC layer)
    rust/kernel/hwmon.rs: generic hwmon registration with pinning and a
    self-referential Registration<T> type; attribute callback dispatch for
    two sensor types (chip and temp); a Driver trait with three required
    temp methods (read/write/is_visible) and three chip methods marked
    #[optional] (chip_read/chip_write/chip_is_visible), following the
    existing #[vtable] idiom in rust/kernel/miscdevice.rs. Attribute
    channel masks are derived from the modeled attribute enums rather than
    a hardcoded table. No driver-specific logic lives in this file.

  Patch 2 - hwmon: (tmp108) add Rust TMP108 driver
    A Rust driver for the TI TMP108, exposing 8 sysfs attributes:
    temp1_input, temp1_min, temp1_max, temp1_min_hyst, temp1_max_hyst,
    temp1_min_alarm, temp1_max_alarm, and update_interval (chip channel,
    four conversion-rate buckets, via a Rust-side port of
    find_closest_descending). Numeric and error semantics follow the C
    driver (millidegree truncation, write clamping, absolute-value
    hysteresis ABI, EAGAIN for one-shot conversion not ready).

[3] Scope statement

The abstraction deliberately covers a subset of hwmon, and the cut is made
by a single rule: an attribute family is included if its shape can be
reused unchanged by a second, different sensor type; it is left out if it
would have to be re-cut per driver. Under that rule the temp attribute set
is the 7 entries shared by TMP108 and the hwmon temp templates
(input/min/max/*_hyst/*_alarm); the crit family is left out of the enum
entirely (TMP108 has no crit registers, so keeping it would force a
per-driver re-cut), and update_interval lives in a separate ChipAttr
because it cannot be reused on the temp type at all. Everything else
(label strings, in/curr/power/fan channels, multi-channel config, the
remaining 16 chip attributes) is left for follow-up work.

On the driver side, update_interval was originally a known gap relative to
the C driver; it is implemented in this series, so patch 2 now matches the
C driver's attribute surface item for item.

[4] Testing

Evidence is stated per level, and the wording matches the level:

  - Both patches apply and compile against the 7.3.0-rc5 source tree
    (kernel tarball, rustc 1.85.0, bindgen 0.73.2). A forced rebuild of
    the driver reports zero warnings and zero errors; CLIPPY=1 reports
    zero warnings, and a build with RUSTDOCFLAGS="-D warnings" reports
    none either. checkpatch reports 0 errors / 0 warnings on both files
    of the series (491 and 573 lines checked, "ready for submission").

  - The driver is boot-tested and exercised end-to-end on i2c-stub in a
    VM. A 22-case regression suite over update_interval (four rate
    buckets, write-then-read-back, out-of-range clamping including
    midpoints, cross-chip table isolation, bit-exact register checks)
    passes 22/22 on the frozen build.

  - The full 8-attribute sysfs surface was diffed attribute by attribute
    against the C driver under i2c-stub; read and write values match on
    every attribute. One environment-dependent difference is documented
    in [5]: update_interval's power-on default reads 4000 ms on i2c-stub
    vs 1000 ms for the C driver, because the C driver sets the rate in
    probe and this driver does not yet replicate that probe-time
    initialization.

  - Lifecycle stress: 500 register/unregister cycles completed with no
    failures and no residue (fails=0, duplicate-attribute=0, kmemleak
    clean). Concurrent access against module removal was exercised too:
    8 concurrent readers across 200 removal cycles, and 4 readers plus 4
    writers across 50 removal cycles, both completed with no faults
    observed in dmesg, no sysfs residue, and kmemleak clean.

    Those concurrent runs were made on a kernel built without KASAN or
    KCSAN. "no faults observed" means exactly that - no observable fault
    under this configuration - and not that a use-after-free or a
    time-of-check/time-of-use window is absent. The structural argument
    for the unregister path is separate, and is stated in [8]: when
    hwmon_device_unregister returns, in-flight sysfs callbacks have
    drained (kernfs_drain in fs/kernfs/dir.c), which is what makes
    dropping the self-referential state safe.

  - The lifecycle stress also surfaced a real defect in this series, and
    this revision fixes it. On the hwmon registration error path, module
    init returned early and left the i2c client it had created
    unregistered, so a failed registration could keep that client
    attached and hold its address until reboot. The error path now
    unregisters the client it created before returning. Before the fix
    the stress loop failed 924/1000 operations; after the fix the frozen
    build completed 500/500 cycles clean. The defect was in the driver's
    module-init error path (samples/rust/tmp108.rs); the abstraction's own
    Registration/Drop path was not implicated.

[5] Known gaps

  - HWMON_C_REGISTER_TZ: The Rust version does not set HWMON_C_REGISTER_TZ,
    so no thermal zone device is registered (the C driver registers one
    per visible temp channel when CONFIG_THERMAL_OF is enabled). Thermal
    integration is left for a follow-up.
  - One-shot mode interaction with system suspend/resume is not modeled
    yet; the EAGAIN path exists but its PM interaction is deferred.
  - The p3t1035 compatible chip (hysteresis bits differ, max/min
    visibility differs) is not handled; the driver is TMP108-only for now.
  - update_interval's power-on default differs from the C driver (4000 ms
    on i2c-stub vs 1000 ms); see [4]. This is a probe-time initialization
    gap in the driver, not an ABI difference.
  - This series is built and exercised against a 7.3.0-rc5 source tarball
    (no git tree). That shows the patches are self-consistent with that
    tree; it does not by itself show they apply unchanged to the current
    rust-next or hwmon-next tip, whose rust/kernel/ APIs may have drifted.
  - All end-to-end evidence comes from i2c-stub in a VM. No physical
    TMP108 hardware was exercised; real-device behavior (in particular
    alarm timing and conversion latency) is unverified.

[6] Open questions

  1. Does the chip-channel shape (ChipAttr + #[optional]
     chip_read/chip_write/chip_is_visible, no default bodies, macro-injected
     build_error!) match what a hwmon Rust abstraction should look like, or
     would you prefer a different split (e.g. a single read/write with an
     enum over both types)?
  2. Is deriving the channel config masks from the attribute enums
     (instead of hardcoding a table) acceptable for the abstraction, or is
     an explicit per-driver config table preferred?
  3. Should the crit family be re-added to the temp attribute enum for
     completeness (drivers that have crit registers would then not need to
     extend the enum), at the cost of a wider enum that most drivers partially
     use?
  4. Is a TMP108 driver useful as the first in-tree consumer of the
     abstraction, or would a different driver (or a sample under samples/)
     serve better?

[7] Baseline

Both patches apply and compile against the 7.3.0-rc5 mainline source
tarball (no git tree; commit identity = the 7.3.0-rc5 release), with the
rust toolchain versions listed in [4].

[8] Differences from the RFC v0.1 abstraction

Relative to Donjuanplatinum's original RFC layer, this series changes:

  - Registration: the RFC used devm-based registration; here a
    self-referential Registration<T> owns its inner state, pins it, and
    unregisters in Drop. hwmon_device_unregister returning guarantees all
    in-flight sysfs callbacks have drained (kernfs_drain waits for active
    references in fs/kernfs/dir.c), which is what makes dropping the
    self-referential state safe.
  - Channel info: the channel info array now carries a chip channel in
    addition to two temp channels (3 entries + NULL terminator), and the
    chip config mask is included.
  - Optional methods: chip callbacks use #[optional] with no default
    bodies (per rust/macros/vtable.rs, which rejects #[optional] methods
    with bodies); the adapter layer registers hwmon_ops callbacks only
    when the driver implements them.
  - Error-path cleanup: the RFC layer relied on devm; here the driver's
    module-init error path releases what it created explicitly. If hwmon
    registration fails, the i2c client that init created is unregistered
    before init returns, so a failed registration does not leave the
    client attached. SAFETY: that client pointer is created in this
    function (non-null, not ERR_PTR) and, on the failure branch, has not
    been handed to hwmon and no in-flight callback can reach it, so the
    explicit i2c_unregister_device is sound.

[9] Closing

I am not expecting a merge decision with this posting. My aim is to put a
concrete, working series in front of the subsystem so the abstraction
design can be reviewed on its own merits. I am awaiting guidance on the
maintainership question and on the open questions above, and will revise
the series accordingly.

Thanks,
<SENDER NAME>

