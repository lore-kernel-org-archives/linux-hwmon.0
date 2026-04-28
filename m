Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CE13F0ABA;
	Tue, 28 Apr 2026 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373084; cv=none; b=HUzSxX30jJ41RgfAQ4D9ufCp0597GazdiEAQn19bJJe3nsVMBo8hnbGkpQKhkXMwMw0tLcX234qnBe+fFFpdsgM2UvDXS7gSNng0vEQxSyoxIv9oCXZVQS0k89TRfkx6WZ8CBY93E5EX1OQYLz1QrRB+/XFYTywRyVTkHAOTHCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373084; c=relaxed/simple;
	bh=xdacuyUeEXZQxsGnLr8bz72RcWkaLniEoDmeZmV5wBw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GujiBOTDxdsS76mQEcGCq266nrK6myTQhf0Pir0CtjQZ4ErIlYLZwW2kaLvp1t9irtpLuB91zwgKq25j4ZISm+aZVfP979a6hvWdQrPhNj8A8EkOCJZrY5TXKhwu5t4XWCS8HbBzvbLX5tfhTsBt85FO5RkJeRAwsxaoSu1as84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgoYY3Z5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgoYY3Z5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777373082; x=1808909082;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xdacuyUeEXZQxsGnLr8bz72RcWkaLniEoDmeZmV5wBw=;
  b=VgoYY3Z5wR3Zwl7eEWbTjBrVhMpZy5t86c+hAfxUilIDdExF8LT6+9V7
   4Qnsf6/FP/E/pAFK71jaxSo+F5M2t+TIt73xF0gyS2HQXEYSGESoQ7kDe
   /dJ7Ve5UDJ2P5NZUErQguHHjMV6mDon3KvhAVRnomOrgJ7mchPskGr2YP
   hHykGyXsv3uMCPSQLAhgbp/sWB0LWV/QmWXS95Zxq/L42TuxY2GFh7Wue
   5wBFPn2dE0a7G+zS6Ex/5DvhyO5u4jydWSRVQ0kkOkfBX+VEvXhkaTouJ
   C/dAYd95DlvEaV73yA5QJwmbywUVNv+BKyIlG2pHOIstshQ1h+RM2Kgl3
   A==;
X-CSE-ConnectionGUID: Qiwa3ktvT2uT8/Id2RhNww==
X-CSE-MsgGUID: a9NXy4eYTOu4VUA6XWn+Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95691668"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="95691668"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 03:44:41 -0700
X-CSE-ConnectionGUID: 7w4zth1KQeKuQZax1OedcA==
X-CSE-MsgGUID: ezGPJly/Rpa0pU7xJkwy6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="238262917"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 03:44:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 28 Apr 2026 13:44:33 +0300 (EEST)
To: Sergio Melas <sergiomelas@gmail.com>
cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, 
    linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
    "Derek J . Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>
Subject: Re: [PATCH v2 1/2] hwmon: (yogafan) Use u32 types and improve RLLag
 filter
In-Reply-To: <20260417142455.18806-1-sergiomelas@gmail.com>
Message-ID: <120f01a2-c77f-8be6-68a9-3abc574c0c95@linux.intel.com>
References: <20260417142455.18806-1-sergiomelas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1651206713-1777373073=:1128"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1651206713-1777373073=:1128
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 17 Apr 2026, Sergio Melas wrote:

> This update transitions the driver to a Hardware Abstraction Layer (HAL)
> to manage diverse Embedded Controller (EC) behaviors across different
> hardware generations.

This is quite vague. Please be more precise.

> The update introduces support for legacy discrete-step ECs by
> implementing linear estimation logic. To maintain physical consistency
> of the RLLag filter, distinct physical profiles were defined. Dynamics
> (Tau and Slew Rate) for these profiles are derived by scaling reference
> measurements from a Yoga 14cACN based on fan diameter (assuming moment
> of inertia J =E2=88=9D d=C2=B2).
>=20
> To prevent resource conflicts with the 'lenovo-wmi-other' driver on
> modern gaming models, explicit WMI GUID detection is added to the
> probe sequence. This allows the driver to yield control when WMI-based
> management is present while providing telemetry for legacy and non-WMI
> systems.
>=20
> Assisted-by: Google:Gemini-3-Flash [DSDT/XML-Data-Aggregation & Formattin=
g]
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> ---
> v2: Inprovements after feedback
>  - Split patch into two parts for easier review
>  - Enforced system vendor matching (LENOVO) in all DMI quirk entries.
>  - Moved the polling interval check before ACPI calls in yoga_fan_read()
>    to protect the EC from rapid polling spam.
>  - Restored 'static const' qualifiers for hardware configuration
>    profiles to ensure .rodata placement.
>  - Cleaned up redundant logic and transitioned internal comments to
>    English in yoga_fan_probe().
>  - Dropped superlatives and simplified the commit message tone.
>=20
> v1: Fresh baseline for HAL refactoring.
>  - Integrated 7-section structural reorganization for both the
>    DMI quirk table and the yogafan.rst HAL table to support 400+ models.
>  - Added support for legacy discrete-step EC logic (Nmax > 0).
>  - Integrated documentation markup improvements suggested by Randy Dunlap=
=2E
>  - Resolved "phantom fan" issues by implementing deterministic ACPI path
>    discovery that respects the expected fan count for each profile.
>  - Physics Consistency: Modified the RLLag filter to use per-device
>    constants (internal_tau_ms). Time parameters (Tau/Slew) were measured
>    on a reference Yoga 14cACN; parameters for other models are currently
>    estimations derived from fan-size scaling (J =E2=88=9D d=C2=B2).
>  - Mathematical Safety: Implemented safety clamps and used resolved
>    device_max_rpm as a physical basis to prevent potential division-by-ze=
ro.
>  - State Protection: yoga_fan_read() now handles static attributes (max)
>    immediately to prevent corruption of the filter timing state.
>  - Implemented WMI GUID detection in the probe sequence for WMI coexisten=
ce.
>=20
> History:
>  - Base Driver : Established the core RLLag filter logic and
>    initial support for ~12 modern Yoga/Legion families.
> ---
>  Documentation/hwmon/yogafan.rst | 585 +++++++++++++++++++++++++++-----
>  drivers/hwmon/yogafan.c         | 286 ++++++++++++----
>  2 files changed, 719 insertions(+), 152 deletions(-)
>=20
> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafa=
n.rst
> index c553a381f..c07284acd 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -1,106 +1,212 @@
>  .. SPDX-License-Identifier: GPL-2.0-only
> =20
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Kernel driver yogafan
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -Supported chips:
> +The yogafan driver provides fan speed monitoring for Lenovo consumer
> +laptops (Yoga, Legion, IdeaPad) by interfacing with the Embedded
> +Controller (EC) via ACPI, implementing a Rate-Limited Lag (RLLag)
> +filter to ensure smooth and physically accurate RPM telemetry.
> =20
> -  * Lenovo Yoga, Legion, IdeaPad, Slim, Flex, and LOQ Embedded Controlle=
rs
> -  * Prefix: 'yogafan'
> -  * Addresses: ACPI handle (See Database Below)
> =20
> -Author: Sergio Melas <sergiomelas@gmail.com>
> +**Supported Hardware**
> +
> +The ``yogafan`` driver supports over 400 Lenovo models released
> +between 2011 and 2026. Hardware is categorized by the following
> +series:
> +
> +* 1. YOGA SERIES (8-bit Continuous / Discrete Logic)
> +  - Yoga 14cACN (82N7), 14s, 13
> +
> +* 2. IDEAPAD SERIES (8-bit Continuous / Discrete Logic)
> +  - IdeaPad 5, 5i (81YM)
> +
> +* 3. Legion SERIES (8-bit Continuous / 16-bit Logic)
> +  - Legion 5 (82JW)
> +
> +    Prefix: 'yogafan'
> +
> +    Addresses: ACPI handle (DMI Quirk Table Fallback)
> +
> +    Datasheet: Not available; based on ACPI DSDT and EC reverse
> +    engineering.
> =20
> -Description
> ------------
> +Author: Sergio Melas <sergiomelas@gmail.com>
> =20
> -This driver provides fan speed monitoring for modern Lenovo consumer lap=
tops.
> -Most Lenovo laptops do not provide fan tachometer data through standard
> -ISA/LPC hardware monitoring chips. Instead, the data is stored in the
> -Embedded Controller (EC) and exposed via ACPI.
> +**Description**
> +
> +This driver provides fan speed monitoring for a wide range of Lenovo
> +consumer laptops. Unlike standard ThinkPads, these models do not use
> +the 'thinkpad_acpi' interface for fan speed but instead store fan
> +telemetry in the Embedded Controller (EC).
> +
> +The driver interfaces with the ACPI namespace to locate the fan
> +tachometer objects. If the ACPI path is not standard, it falls back
> +to a machine-specific quirk table based on DMI information.
> +
> +This driver covers 400 models=E2=80=94over 85% of Lenovo's consumer and
> +ultra-portable laptop portfolio released between 2011 and 2026.
> +It provides a unified hardware abstraction layer for diverse 8-bit,
> +16-bit, and discrete-step Embedded Controller (EC) architectures
> +across 11 families. Support is validated via FOPTD (First Order
> +Plus Time Delay) verification to ensure the RLLag filter accurately
> +reflects physical fan dynamics across different sampling rates.
> +
> +Specific table entries define unique quirks for ~40 verified models, whi=
le
> +high-integrity family-level matching provides deterministic support for =
the
> +remaining 400 standard devices. This ensures zero-day compatibility for =
the
> +broader Lenovo ecosystem.
> +
> +The driver implements a passive discrete-time first-order lag filter
> +with slew-rate limiting (RLLag). This addresses low-resolution
> +tachometer sampling in the EC by smoothing RPM readings based on
> +the time delta (dt) between userspace requests, ensuring physical
> +consistency without background task overhead or race conditions.
> +
> +The driver architecture is grounded in a Bow-Tie risk analysis
> +(IEC 61508/61511) to ensure deterministic telemetry and prevent thermal
> +monitoring failures across the supported product stack.
> +
> +**Filter Physics (RLLag )**
> +
> +To address low-resolution tachometer sampling in the Embedded Controller=
,
> +the driver implements a passive discrete-time first-order lag filter
> +with slew-rate limiting.
> +
> +* Multirate Filtering: The filter adapts to the sampling time (dt) of th=
e
> +  userspace request.
> +* Discrete Logic: For older models (e.g., Yoga 710), it estimates RPM ba=
sed
> +  on discrete duty-cycle steps.
> +* Continuous Logic: For modern models (e.g., Legion), it maps raw
> +  high-precision units to RPM.
> =20
>  The driver implements a **Rate-Limited Lag (RLLag)** filter to handle
> -the low-resolution and jittery sampling found in Lenovo EC firmware.
> +low-resolution sampling in Lenovo EC firmware. The update equation is:
> =20
> -Hardware Identification and Multiplier Logic
> ---------------------------------------------
> +    **RPM_state[t+1] =3D**
> +    **RPM_state[t] +**
> +    **Clamp(Alpha * (raw_RPM[t] - RPM_state[t]), -limit[t], limit[t])**
> =20
> -The driver supports two distinct EC architectures. Differentiation is ha=
ndled
> -deterministically via a DMI Product Family quirk table during the probe =
phase,
> -eliminating the need for runtime heuristics.
> +    Where:
> =20
> -1. 8-bit EC Architecture (Multiplier: 100)
> +*   Time delta between reads:
> =20
> -   - **Families:** Yoga, IdeaPad, Slim, Flex.
> -   - **Technical Detail:** These models allocate a single 8-bit register=
 for
> -     tachometer data. Since 8-bit fields are limited to a value of 255, =
the
> -     BIOS stores fan speed in units of 100 RPM (e.g., 42 =3D 4200 RPM).
> +       **Ts[t]    =3D Sys_time[t+1] - Sys_time[t]**
> =20
> -2. 16-bit EC Architecture (Multiplier: 1)
> +*   Low-pass smoothing factor
> =20
> -   - **Families:** Legion, LOQ.
> -   - **Technical Detail:** High-performance gaming models require greate=
r
> -     precision for fans exceeding 6000 RPM. These use a 16-bit word (2 b=
ytes)
> -     storing the raw RPM value directly.
> +       **Alpha    =3D 1 - exp(-Ts[t] / Tau)**
> +
> +*   Time-normalized slew limit
> +
> +       **limit[t] =3D MAX_SLEW_RPM_S * Ts[t]**
> +
> +To avoid expensive floating-point exponential calculations in the kernel=
,
> +we use a first-order Taylor/Bilinear approximation:
> +
> +       **Alpha =3D Ts / (Tau + Ts)**
> =20
> -Filter Details
> ---------------
> +Implementing this in the driver state machine:
> =20
> -The RLLag filter is a passive discrete-time first-order lag model that e=
nsures:
> -  - **Smoothing:** Low-resolution step increments are smoothed into 1-RP=
M increments.
> -  - **Slew-Rate Limiting:** Prevents unrealistic readings by capping the=
 change
> +*   Next step filtered RPM:
> +       **RPM_state[t+1] =3D RPM_new**
> +*   Current step filtered RPM:
> +       **RPM_state[t]   =3D RPM_old**
> +*   Time step Calculation:
> +       **Ts             =3D current_time - last_sample_time**
> +*   Alpha Calculation:
> +       **Alpha           =3D Ts / (Tau + Ts)**
> +*   RPM  step Calculation:
> +       **step           =3D Alpha * (raw_RPM -  RPM_old)**
> +*   Limit  step Calculation:
> +       **limit           =3D MAX_SLEW_RPM_S * Ts**
> +*   RPM physical step Calculation:
> +       **step_clamped   =3D clamp(step, -limit, limit)**
> +*   Update of RPM
> +       **RPM_new        =3D RPM_old + step_clamped**
> +*   Update internal state
> +       **RPM_old        =3D RPM_new**
> +
> +The input of the filter (raw_RPM) is derived from the EC using the logic
> +defined in the HAL section below.
> +
> +The driver exposes the RLLag  physical filter parameters (time constant
> +and slew-rate limit) in SI units (seconds), dynamically synchronizing th=
em
> +with the specific model's maximum RPM to ensure a consistent physical
> +response across the entire Lenovo product stack.
> +
> +This approach ensures that the RLLag filter is a passive discrete-time
> +first-order lag model:
> +  - **Smoothing:** Low-resolution step increments are smoothed into 1-RP=
M
> +  increments.
> +  - **Slew-Rate Limiting:** Prevents unrealistic readings by capping the
> +  change
>      to 1500 RPM/s, matching physical fan inertia.
> -  - **Polling Independence:** The filter math scales based on the time d=
elta
> -    between userspace reads, ensuring a consistent physical curve regard=
less
> -    of polling frequency.
> +  - **Polling Independence:** The filter math scales based on the time
> +  delta between userspace reads, ensuring a consistent physical curve
> +  regardless of polling frequency.
> =20
> -Suspend and Resume
> -------------------
> +**Hardware Identification and Multiplier Logic**
> =20
> -The driver utilizes the boottime clock (ktime_get_boottime()) to calcula=
te the
> -sampling delta. This ensures that time spent in system suspend is accoun=
ted
> -for. If the delta exceeds 5 seconds (e.g., after waking the laptop), the
> -filter automatically resets to the current hardware value to prevent
> -reporting "ghost" RPM data from before the sleep state.
> +The driver supports three distinct EC architectures. Differentiation is
> +handled deterministically via a DMI Product Family quirk table during th=
e
> +probe phase, eliminating the need for runtime heuristics.
> =20
> -Usage
> ------
> +**Continuous RPM Reads**
> =20
> -The driver exposes standard hwmon sysfs attributes:
> +1. 8-bit EC Architecture (Multiplier: 100)
> +   - **Families:** Yoga, IdeaPad, Slim, Flex, Xiaoxin.
> +   - **Technical Detail:** These models allocate a single 8-bit register
> +   for tachometer data. Since 8-bit fields are limited to a value of 255=
,
> +   the BIOS stores fan speed in units of 100 RPM (e.g., 42 =3D 4200 RPM)=
=2E
> =20
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Attribute         Description
> -fanX_input        Filtered fan speed in RPM.
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +2. 16-bit EC Architecture (Multiplier: 1)
> +   - **Families:** Legion, LOQ, GeekPro.
> +   - **Technical Detail:** High-performance gaming models require greate=
r
> +   precision for fans exceeding 6000 RPM. These use a 16-bit word (2 byt=
es)
> +   storing the raw RPM value directly.
> =20
> +**Discrete RPM Reads**
> =20
> -Note: If the hardware reports 0 RPM, the filter is bypassed and 0 is rep=
orted
> -immediately to ensure the user knows the fan has stopped.
> +3. Discrete Level Architecture (Linear Estimation)
> +   - **Families:** Yoga 710/510/13, IdeaPad 500S, Legacy U-Series.
> +   - **Technical Detail:** Older or ultra-portable EC firmware does not
> +   store    a real-time tachometer value. Instead, it operates on a fixe=
d
> +   number of discrete PWM states (Nmax). The driver translates these lev=
els
> +   into an estimated physical RPM using the following linear mapping:
> =20
> +     raw_RPM =3D (Rmax * IN) / Nmax
> =20
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> -                 LENOVO FAN CONTROLLER: MASTER REFERENCE DATABASE (2026)
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +     Where:
> +     - IN:   Current discrete level read from the EC.
> +     - Nmax: Maximum number of steps defined in the BIOS (e.g., 59, 255)=
=2E
> +     - Rmax: Maximum physical RPM of the fan motor at full duty cycle.
> =20
> -::
> +   - **Filter Interaction:** Because these hardware reads jump abruptly
> +     between levels (e.g., from level 4 to 5), the RLLag filter is
> +     essential here to simulate mechanical acceleration, smoothing the
> +     transition for the final fanX_input attribute.
> +
> +**Suspend and Resume**
> +
> +The driver utilizes the boottime clock (ktime_get_boottime()) to calcula=
te
> +the sampling delta. This ensures that time spent in system suspend is
> +accounted for.
> +If the delta exceeds 5 seconds (e.g., after waking the laptop), the
> +filter automatically resets to the current hardware value to prevent
> +reporting "ghost" RPM data from before the sleep state.
> +
> +**Usage**
> +
> +The driver exposes standard hwmon sysfs attributes:
> +Attribute         Description
> +fanX_input        Filtered fan speed in RPM.
> =20
> - MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH  =
        | WIDTH  | MULTiplier
> - -----------------------------------------------------------------------=
-----------------------------
> - 82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS=
        |  8-bit | 100
> - 80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0=
        |  8-bit | 100
> - 83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS=
        |  8-bit | 100
> - 82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS=
        |  8-bit | 100
> - 81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0=
        |  8-bit | 100
> - 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS=
 (Fan1) | 16-bit | 1
> - 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S=
 (Fan2) | 16-bit | 1
> - 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS=
 (Fan1) | 16-bit | 1
> - 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S=
 (Fan2) | 16-bit | 1
> - 82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS=
 /FA2S  | 16-bit | 1
> - 83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0=
        |  8-bit | 100
> - 81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0=
        |  8-bit | 100
> - *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0  =
        |  8-bit | 100
> - -----------------------------------------------------------------------=
-----------------------------
> +Note: If the hardware reports 0 RPM, the filter is bypassed and 0 is
> +reported immediately to ensure the user knows the fan has stopped.
> +
> +**Lenovo Fan HAL**
> =20
>  METHODOLOGY & IDENTIFICATION:
> =20
> @@ -110,29 +216,342 @@ METHODOLOGY & IDENTIFICATION:
>     EmbeddedControl OperationRegion offsets.
> =20
>  2. EC MEMORY MAPPING (THE OFFSET):
> -   Validated by matching NBFC (NoteBook FanControl) XML logic with DSDT =
Field
> -   definitions found in BIOS firmware.
> +   Validated by matching NBFC (NoteBook FanControl) XML logic with DSDT
> +   Field    definitions found in BIOS firmware. This ensures the driver
> +   reads from the    correct RAM offset within the Embedded Controller.
> =20
>  3. DATA-WIDTH ANALYSIS (THE MULTIPLIER):
> -   - 8-bit (Multiplier 100): Standard for Yoga/IdeaPad. Raw values (0-25=
5).
> -   - 16-bit (Multiplier 1): Standard for Legion/LOQ. Two registers (0xFE=
/0xFF).
> +   - 8-bit (Multiplier 100): Standard for Yoga/IdeaPad. Raw values (0-25=
5)
> +   represent units of 100 RPM.
> +   - 16-bit (Multiplier 1): Standard for Legion/LOQ. High-precision 16-b=
it
> +   readings spread across two registers (0xFE/0xFF) for raw RPM telemetr=
y.
> +   - 8-bit (Nmax Levels): Used  in some older model. Raw values (0-Nmax)
> +   represent units of RMAX // NMAX  RPM.
> +
> +4. WMI COEXISTENCE & FILTERING (THE SELECTION):
> +   The hardware table has been strictly filtered by cross-referencing
> +   findings with the 'lenovo-wmi-other' driver. Models and interfaces
> +   natively supported via WMI GUIDs (such as modern Legion/LOQ series)
> +   have been excluded from    this HAL description to ensure determinist=
ic
> +   driver separation and prevent double-reporting.
> +
> +Which gives the table here:
> +
> +::
> +=09**Lenovo Fan HAL Database**
> +
> +=09=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D =3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=09ID   FAMILY       OFF  PATH  WID NMAX RMAX MULT Tms SLW NOTES
> +=09=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D =3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=0982N7 Yoga 14cACN  06  .FANS  8b  0    5500 100  1k   4   **[REF]**
> +=0981YM IdeaPad 5    06  .FAN0  8b  0    4500 100  1k   4   Standard
> +=0982JW Legion 5     06  .FANS  8b  0    6500 1    1.3k 5   Gaming dual
> +=09=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=
=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +
> +Note 1: Dual-path entries for a single fan (e.g., FAN0/.FANS) denote
> +sub-model address variations tested sequentially during probe.
> +Designation (FanX) identifies discrete sensors in multi-fan configuratio=
ns.
> +
> +Note 2: The raw speed (raw_RPM) is derived based on the architecture:
> +
> +* Discrete Level Estimation (Nmax > 0):
> +  raw_RPM =3D (Rmax * IN) / Nmax
> +
> +* Continuous Unit Mapping (Nmax =3D 0):
> +  raw_RPM =3D IN * Multiplier
> +
> +Note 3: Dynamic parameters (TAU and SLEW) are calibrated against the
> +reference Yoga 14cACN (d=3D50mm). Fleet-wide estimates are derived by
> +scaling the mechanical time constant relative to fan diameter (d)
> +based on the moment of inertia relationship (J =E2=88=9D d=C2=B2). These=
 provide a
> +deterministic physical baseline for the RLLag filter and are subject
> +to community verification.
> =20
> +Note 4: The "ACPI PATH"column is relative to \_SB.PCI0.LPC0.EC0
> =20
> -References
> -----------
> +**Safety and Design Integrity**
> =20
> -1. **ACPI Specification (Field Objects):** Documentation on how 8-bit vs=
 16-bit
> -   fields are accessed in OperationRegions.
> +The yogafan driver is designed following the principles of **IEC 61508**
> +(Functional Safety), **IEC 61511** (Process Safety), and **IEC 62443**
> +(Industrial Cybersecurity) to ensure high availability and safety.
> +
> +A Bow-Tie risk analysis was performed to identify threats and implement
> +preventative barriers directly into the driver logic:
> +
> +* **Deterministic Resource Management (IEC 61508)**:
> +  By utilizing a hardcoded MAX_FANS limit and managed allocation
> +  (devm_kzalloc), the driver eliminates dynamic memory errors and ensure=
s
> +  deterministic boundaries during hardware discovery.
> +
> +* **Physical Integrity (IEC 61511)**:
> +  The RLLag filter implements slew-rate limiting (matching physical fan
> +  inertia) and auto-reset logic. This ensures that telemetry accurately
> +  reflects the hardware state and prevents reported RPM from jumping fas=
ter
> +  than the physical motor can accelerate.
> +
> +* **Cybersecurity Gating (IEC 62443)**:
> +  The driver implements "Defense in Depth" by requiring a successful DMI
> +  match   from a read-only quirk table before any platform device
> +  registration or   ACPI namespace interaction occurs.
> +
> +* **Mathematical Robustness**:
> +  All telemetry calculations utilize fixed-point arithmetic (div64_s64) =
to
> +  ensure consistent execution time and prevent the non-deterministic jit=
ter
> +  associated with floating-point operations in safety-critical paths.
> +
> +Coming from an industrial automation background, I have applied the
> +risk-assessment and safety frameworks I work with daily (IEC 61508, 6151=
1
> +and 62443) to ensure the robustness of this driver. This approach
> +represents a humble reliance on established industrial methodologies to
> +guarantee code integrity and safety, as I am less familiar with the
> +advanced formal verification techniques specific to the Linux kernel
> +community. I am open to guidance if this documentation style or the
> +implemented safety barriers deviate from standard kernel practices.
> +
> +::
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  SAFETY AND CYBERSECURITY INTEGRITY REPORT: LENOVO YOGAFAN DRIVER
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  Standards Compliance : IEC 61508, IEC 61511, ISA-99 / IEC 62443
> +  Document Type        : Full Bow-Tie Risk Analysis &  Traceability
> +  Source Reference     : yogafan.c (Sergio Melas)
> +
> +  Performed by Sergio Melas 8 of april 2026
> +  -----------------------------------------
> +
> +  CHUNK 1: GLOBAL DEFINITIONS AND CORE PARAMETERS
> +  -----------------------------------------------
> +  Reference: Includes, Macros (DRVNAME, MAX_FANS, MAX_SAMPLING),
> +  and Structs.   Hazard: Monitoring failure leading to thermal instabili=
ty
> +  or kernel panic.
> +
> +  A. Functional Safety (IEC 61508)
> +    - Threat      : Memory overflow/out-of-bounds access during discover=
y.
> +    - Preventative: MAX_FANS constant (3) ensures deterministic stack an=
d
> +                    allocation boundaries.
> +    - Consequence : Loss of monitoring; potential hardware damage.
> +    - Mitigation  : Spatial isolation via private data encapsulation and
> +                    static symbol scoping.
> +
> +  B. Process Safety (IEC 61511)
> +    - Threat      : Filter instability/oscillation due to rapid polling.
> +    - Preventative: MIN_SAMPLING (100ms) and MAX_SAMPLING (5000ms) macro=
s
> +                    define the valid operational window.
> +    - Consequence : Incorrect cooling response (Process Deviation).
> +    - Mitigation  : RPM_FLOOR_LIMIT ensures a deterministic 0 RPM
> +    safe-state when raw data is below physical thresholds.
> +
> +  C. Cybersecurity (IEC 62443)
> +    - Threat      : Logic injection via manipulated configuration memory=
=2E
> +    - Preventative: Static typing of 'struct yogafan_config' prevents
> +                    unauthorized runtime memory shifts.
> +    - Consequence : Unauthorized Embedded Controller (EC) access.
> +    - Mitigation  : Reliance on verified math64.h and hwmon.h audited
> +                    primitives to reduce attack surface.
> +
> +
> +  CHUNK 2: HARDWARE ARCHITECTURE PROFILES
> +  -----------------------------------------------------------------
> +  Reference: Static config profiles (yoga_continuous, legion_high_perf,
> +  etc.).
> +  Hazard: Hardware Mismatch (Software mismatch with physical EC
> +  architecture).
> +
> +  A. Functional Safety (IEC 61508)
> +    - Threat      : Systematic Fault (Incorrect multiplier/n_max
> +    assignment).
> +    - Preventative: Static profile definitions; parameters cannot be
> +    modified
> +                    by external kernel threads.
> +    - Consequence : Incorrect RPM calculation; reporting "0" under load.
> +    - Mitigation  : Profile-specific 'r_max' prevents integer scaling
> +    errors during high-precision RPM estimation.
> +
> +  B. Process Safety (IEC 61511)
> +    - Threat      : Telemetry clipping (r_max lower than fan capability)=
=2E
> +    - Preventative: MIN_THRESHOLD_RPM constant (10) ensures a safety flo=
or
> +                    independent of DMI-provided data.
> +    - Consequence : Delayed thermal response; software saturation.
> +    - Mitigation  : Profiles align with register offsets in verified DSD=
T
> +                    Field objects (e.g., FANS, FA2S).
> +
> +  C. Cybersecurity (IEC 62443)
> +    - Threat      : Spoofing (Forcing high-perf model into low-perf
> +    profile).
> +    - Preventative: Const-initialization ensures hardware profiles are
> +                    immutable at runtime.
> +    - Consequence : Denial of Service (Thermal Shutdown).
> +    - Mitigation  : Hardcoded 'paths' array prevents redirection of the
> +                    driver to unauthorized ACPI namespace objects.
> +
> +
> +  CHUNK 3: RLLAG FILTER PHYSICS ENGINE
> +  ---------------------------------------------
> +  Reference: Function 'apply_rllag_filter'.
> +  Hazard: Telemetry Aliasing leading to erroneous thermal decisions.
> +
> +  A. Functional Safety (IEC 61508)
> +    - Threat      : Arithmetic Overflow or Zero-Division crashes.
> +    - Preventative: Fixed-Point Arithmetic (div64_s64) ensures determini=
sm
> +                    without FPU execution-time variance.
> +    - Consequence : Internal state corruption; CPU hang.
> +    - Mitigation  : Auto-Reset Logic (dt_ms > MAX_SAMPLING) snaps to raw
> +                    value to clear accumulated error states.
> +
> +  B. Process Safety (IEC 61511)
> +    - Threat      : Physical Mismatch (Software delta > mechanical
> +    inertia).
> +    - Preventative: Slew-Rate Limiting (internal_max_slew_rpm_s) matches
> +                    real-world fan acceleration dynamics.
> +    - Consequence : Process oscillation; misleading thermal state.
> +    - Mitigation  : Snap-to-Zero logic for truth in reporting "Stopped"
> +    states to OS thermal governors.
> +
> +  C. Cybersecurity (IEC 62443)
> +    - Threat      : Resource Exhaustion (CPU cycle drain via polling spa=
m).
> +    - Preventative: dt_ms < MIN_SAMPLING check ignores high-frequency
> +                    interrupt/jitter requests.
> +    - Consequence : Excessive CPU utilization; thermal protection bypass=
=2E
> +    - Mitigation  : Input 'raw_rpm' is clamped against 'device_max_rpm'
> +                    ceiling before entering the math block.
> +
> +
> +  CHUNK 4: HWMON SUBSYSTEM INTERACTION
> +  -----------------------------------------------------
> +  Reference: Functions 'yoga_fan_read' and 'yoga_fan_is_visible'.
> +  Hazard: Reporting stale or invalid data for non-existent sensors.
> +
> +  A. Functional Safety (IEC 61508)
> +    - Threat      : Channel Crosstalk (Accessing invalid fan indices).
> +    - Preventative: Visibility Gating (is_visible) restricts sysfs nodes
> +                    strictly to handles validated at probe.
> +    - Consequence : Diagnostic failure; wrong fan speed reported.
> +    - Mitigation  : ACPI_FAILURE(status) check immediately returns -EIO
> +                    to prevent the processing of invalid data.
> +
> +  B. Process Safety (IEC 61511)
> +    - Threat      : State Corruption (Querying static info updates filte=
r).
> +    - Preventative: Attribute Isolation: fan_max queries return constant=
s
> +                    immediately, bypassing active filter updates.
> +    - Consequence : Telemetry jitter; ghost RPM spikes.
> +    - Mitigation  : (s64) promotion before division in 'yoga_fan_read'
> +                    prevents integer math overflow.
> +
> +  C. Cybersecurity (IEC 62443)
> +    - Threat      : Information Leakage (Probing unauthorized ACPI
> +    handles).
> +    - Preventative: Handle Encapsulation within the private
> +    'active_handles'
> +                    array, inaccessible to other kernel modules.
> +    - Consequence : Unauthorized ACPI discovery.
> +    - Mitigation  : Standardized 'hwmon_ops' interface restricts driver
> +                    interaction to audited sensor pathways.
> +
> +
> +  CHUNK 5: HARDWARE IDENTIFICATION DATABASE
> +  -----------------------------------------------------
> +  Reference: Symbol 'yogafan_quirks[]'.
> +  Hazard: Integrity Violation leading to incorrect safety-state selectio=
n.
> +
> +
> +  A. Functional Safety (IEC 61508)
> +    - Threat      : Invalid pointer dereference or table lookup corrupti=
on.
> +    - Preventative: Sentinel-terminated quirk array ensures deterministi=
c
> +                    iteration boundaries for hardware matching.
> +    - Consequence : Kernel panic or driver crash during the probe sequen=
ce.
> +    - Mitigation  : Mandatory integrity check of the 'driver_data' point=
er
> +                    prior to any physical register access.
> +
> +  B. Process Safety (IEC 61511)
> +    - Threat      : Systematic Logic Error (Family fallback mismatches).
> +    - Preventative: Hierarchical Precedence: Specific product names matc=
hed
> +                    before generalized product families.
> +    - Consequence : Scaling mismatches; sensor reporting failure.
> +    - Mitigation  : Fallbacks (e.g., Yoga Family) provide a "Safe-Standa=
rd"
> +                    layer of protection for unlisted hardware.
> +
> +  C. Cybersecurity (IEC 62443)
> +    - Threat      : Spoofing (Malicious alteration of hardware match).
> +    - Preventative: Read-Only Section (.rodata) placement via
> +    'static const'
> +                    prevents runtime tampering by exploits.
> +    - Consequence : Consequence: Thermal Denial of Service
> +    (Emergency Shutdown)
> +    - Mitigation  : DMI_MATCH strings provide unique hardware-specific
> +                    authentication for profile assignment.
> +
> +  CHUNK 6: PROBE, DISCOVERY, AND LIFECYCLE
> +  ------------------------------------------------------------
> +  Reference: Functions 'yoga_fan_probe', 'yoga_fan_init', and
> +  'yoga_fan_exit'.
> +  Hazard: Undefined System State or Blind Monitoring.
> +
> +  A. Process Safety (IEC 61511)
> +    - Threat      : Blind Monitoring (Driver loads but find no fans).
> +    - Preventative: 'data->fan_count' loop increments only on
> +                    successful ACPI_SUCCESS handle verification.
> +    - Consequences: Hardware overheating without telemetry reporting.
> +    - Mitigation  : 'fan_count =3D=3D 0' integrity check in 'yoga_fan_pr=
obe'
> +                    triggers ENODEV to enter a Fail-Safe state.
> +
> +  B. Functional Safety (IEC 61508)
> +    - Threat      : Resource Leakage (Failed memory allocations).
> +    - Preventative: 'devm_kzalloc' and 'devm_kcalloc' ensure atomic
> +                    memory cleanup upon probe failure or module exit.
> +    - Consequences: Memory corruption; system resource depletion.
> +    - Mitigation  : DMI check in 'yoga_fan_init' acts as the primary saf=
ety
> +                    gate before any device registration.
> +
> +  C. Cybersecurity (IEC 62443)
> +    - Threat      : Loading on non-Lenovo or unverified hardware.
> +    - Preventative: 'dmi_check_system' acts as hardware-based
> +                    authentication prior to platform registration.
> +    - Consequences: Unauthorized Embedded Controller manipulation.
> +    - Mitigation  : Unique 'DRVNAME' binding in 'yoga_fan_device'
> +                    prevents name-spoofing in the platform bus.
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +
> +**References**
> +
> +1. **ACPI Specification (Field Objects):** Documentation on how 8-bit vs
> +16-bit    fields are accessed in OperationRegions.
>     https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.ht=
ml#field-objects
> =20
>  2. **NBFC Projects:** Community-driven reverse engineering
>     of Lenovo Legion/LOQ EC memory maps (16-bit raw registers).
>     https://github.com/hirschmann/nbfc/tree/master/Configs
> =20
> -3. **Linux Kernel Timekeeping API:** Documentation for ktime_get_boottim=
e() and
> -   handling deltas across suspend states.
> +3. **Linux Kernel Timekeeping API:** Documentation for ktime_get_boottim=
e()
> +and handling deltas across suspend states.
>     https://www.kernel.org/doc/html/latest/core-api/timekeeping.html
> =20
>  4. **Lenovo IdeaPad Laptop Driver:** Reference for DMI-based hardware
>     feature gating in Lenovo laptops.
>     https://github.com/torvalds/linux/blob/master/drivers/platform/x86/id=
eapad-laptop.c
> +
> +5. Yogafan Community Support & DSDT Collection:
> +   Resource for out-of-tree testing scripts and collection of
> +   user-contributed ACPI DSDT dumps for hardware expansion.
> +   https://github.com/sergiomelas/lenovo-linux-drivers
> +
> +6. **IEC 61508:** Functional safety of electrical/electronic/programmabl=
e
> +   electronic safety-related systems.
> +   https://www.iec.ch/functional-safety
> +
> +7. **IEC 61511:** Functional safety - Safety instrumented systems for th=
e
> +   process industry sector.
> +   https://www.iec.ch/functional-safety
> +
> +8. **ISA/IEC 62443:** Security for industrial automation and control
> +systems (formerly ISA-99).
> +   https://www.isa.org/isa99
> +
> +9. **Lenovo WMI Other Driver** Reference for WMI-based fan reporting on
> +   modern Lenovo platforms; used to implement the driver's coexistence
> +   logic and WMI GUID detection.
> +   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/platform/x86/lenovo/wmi-other.c

I'm very skeptical all these documentation changes relate to a same=20
logical change. I didn't even try to read it but on a glance some look=20
purely editorial so this should be split properly as well.

> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 605cc928f..9df42990b 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
> @@ -24,53 +24,107 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/math64.h>
> +#include <linux/minmax.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/wmi.h>
> =20
>  /* Driver Configuration Constants */
>  #define DRVNAME=09=09=09"yogafan"
> -#define MAX_FANS=09=098
> +#define MAX_FANS=09=093
> =20
>  /* Filter Configuration Constants */
> -#define TAU_MS=09=09=091000=09/* Time constant for the first-order lag (=
ms) */
> -#define MAX_SLEW_RPM_S=09=091500=09/* Maximum allowed change in RPM per =
second */
>  #define MAX_SAMPLING=09=095000=09/* Maximum allowed Ts for reset (ms) */
>  #define MIN_SAMPLING=09=09100=09/* Minimum interval between filter updat=
es (ms) */
> =20
>  /* RPM Sanitation Constants */
> -#define RPM_FLOOR_LIMIT=09=0950=09/* Snap filtered value to 0 if raw is =
0 */
> +#define MIN_THRESHOLD_RPM=0910=09/* Minimum safety floor for per-model s=
top thresholds */
> +
> +/* GUID of WMI interface Lenovo */
> +#define LENOVO_WMI_OTHER_MODE_GUID      "DC2A8805-3A8C-41BA-A6F7-092E008=
9CD3B"
> +#define LENOVO_CAPABILITY_DATA_00_GUID  "024D9939-9528-40F7-B4EF-792E008=
9CD3B"
> +#define LENOVO_WMI_FAN_GUID             "05244583-1621-468E-9366-0744D66=
1F033"
> =20
>  struct yogafan_config {
> -=09int multiplier;
> -=09int fan_count;
> -=09const char *paths[2];
> +=09u32 multiplier;=09=09=09/* Used if n_max =3D=3D 0 */
> +=09u32 fan_count;=09=09=09/* 1 to 3 */
> +=09u32 n_max;=09=09=09/* Discrete steps (0 =3D Continuous) */
> +=09u32 r_max;=09=09=09/* Max physical RPM for estimation */
> +=09unsigned int tau_ms;=09=09/* To store the smoothing speed    */
> +=09unsigned int slew_time_s;=09/* To store the acceleration limit */
> +=09unsigned int stop_threshold;=09/* To store the RPM floor */
> +=09const char *paths[MAX_FANS];=09/* Paths */
>  };
> =20
>  struct yoga_fan_data {
>  =09acpi_handle active_handles[MAX_FANS];
>  =09long filtered_val[MAX_FANS];
>  =09ktime_t last_sample[MAX_FANS];
> -=09int multiplier;
> -=09int fan_count;
> +=09const struct yogafan_config *config;
> +=09u32 fan_count;
> +=09/* Per-device physics constants */
> +=09unsigned int internal_tau_ms;
> +=09unsigned int internal_max_slew_rpm_s;
> +=09unsigned int device_max_rpm;
>  };
> =20
> -/* Specific configurations mapped via DMI */
> -static const struct yogafan_config yoga_8bit_fans_cfg =3D {
> -=09.multiplier =3D 100,
> -=09.fan_count =3D 1,
> -=09.paths =3D { "\\_SB.PCI0.LPC0.EC0.FANS", NULL }
> -};
> +/* --- HARDWARE ABSTRACTION LAYER (HAL) ARCHITECTURE PROFILES --- */
> +
> +/* --- 1. CONTINUOUS PROFILES (Nmax =3D 0) --- */

These don't look useful comments.

> +/* 1.1 Single-Fan Continuous */
> =20
> -static const struct yogafan_config ideapad_8bit_fan0_cfg =3D {
> -=09.multiplier =3D 100,
> -=09.fan_count =3D 1,
> -=09.paths =3D { "\\_SB.PCI0.LPC0.EC0.FAN0", NULL }
> +/* Reference Model: Yoga 14cACN (d=3D50mm) - Baseline inertia (Reference=
 J) */
> +static const struct yogafan_config yoga_continuous_8bit_cfg =3D {
> +=09.multiplier =3D 100, .fan_count =3D 1, .n_max =3D 0,
> +=09.r_max =3D 5500, .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshol=
d =3D 50,
> +=09.paths =3D { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FAN0" }

Please don't do any unrelated changes (such as formatting changes) in the=
=20
same patch. Each logical change should be in own patch and properly=20
justified in the changelog.

Here you're changing the formatting to something much messier.

Always add comma to non-terminating entries.

Are .fan_count and number of elements in .paths actually related because=20
I think you just added one extra entry (I'm not familiar enough with this=
=20
driver to tell if that is a problem or not)?

>  };
> =20
> -static const struct yogafan_config legion_16bit_dual_cfg =3D {
> -=09.multiplier =3D 1,
> -=09.fan_count =3D 2,
> +/* 1.2 Dual-Fan Continuous (Gaming & Pro) */
> +
> +/* Legion 5 / GeekPro (d=3D60mm) - Gaming high inertia */
> +static const struct yogafan_config legion_5_cfg =3D {
> +=09.multiplier =3D 1, .fan_count =3D 2, .n_max =3D 0,
> +=09.r_max =3D 6500, .tau_ms =3D 1300, .slew_time_s =3D 5, .stop_threshol=
d =3D 50,
>  =09.paths =3D { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
>  };
> =20
> +/*
> + * Filter Physics (RLLag) - Deterministic Telemetry
> + * ---------------------
> + * To address low-resolution tachometer sampling in the Embedded Control=
ler,
> + * the driver implements a passive discrete-time first-order lag filter
> + * with slew-rate limiting (RLLag).
> + *
> + * The filter update equation is:
> + * RPM_state[t+1] =3D RPM_state[t] + Clamp(Alpha * (raw_RPM[t] - RPM_sta=
te[t]),
> + * -limit[t], limit[t])

This is hard to read as is. I suspect it relates to use of mixed casing=20
and non-logical indentation.

> + * Where:
> + * Ts[t]    =3D Sys_time[t+1] - Sys_time[t]  (Time delta between reads)
> + * Alpha    =3D 1 - exp(-Ts[t] / Tau)        (Low-pass smoothing factor)
> + * limit[t] =3D Slew_Limit * Ts[t]           (Time-normalized slew limit=
)
> + *
> + * To avoid expensive floating-point exponential calculations in the ker=
nel,
> + * we use a first-order Taylor/Bilinear approximation:
> + * Alpha =3D Ts / (Tau + Ts)
> + *
> + * Implementing this in the driver state machine:
> + * Ts             =3D current_time - last_sample_time
> + * Alpha          =3D Ts / (Tau + Ts)
> + * Physics Principles (IEC 61511 / IEC 61508):
> + * step           =3D Alpha * (raw_RPM - RPM_old)
> + * limit          =3D Slew_Limit * Ts
> + * step_clamped   =3D clamp(step, -limit, limit)
> + * RPM_new        =3D RPM_old + step_clamped
> + *
> + * Attributes of the RLLag model:
> + * - Smoothing: Low-resolution step increments are smoothed into 1-RPM i=
ncrements.
> + * - Slew-Rate Limiting: Capping change to ~1500 RPM/s to match physical=
 inertia.
> + * - Polling Independence: Math scales based on Ts, ensuring a consisten=
t physical
> + * curve regardless of userspace polling frequency.
> + * Fixed-point math (2^12) is used to maintain precision without floatin=
g-point
> + * overhead, ensuring jitter-free telemetry for thermal management.

Why are you discussing about floating-points overhead in an in-kernel=20
comment? For what benefit? Comments should explain things related to=20
code.

> + */
>  static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long=
 raw_rpm)
>  {
>  =09ktime_t now =3D ktime_get_boottime();
> @@ -78,35 +132,44 @@ static void apply_rllag_filter(struct yoga_fan_data =
*data, int idx, long raw_rpm
>  =09long delta, step, limit, alpha;
>  =09s64 temp_num;
> =20
> -=09if (raw_rpm < RPM_FLOOR_LIMIT) {
> +=09/* 1. PHYSICAL CLAMP: Use per-device device_max_rpm */
> +=09if (raw_rpm > (long)data->device_max_rpm)
> +=09=09raw_rpm =3D (long)data->device_max_rpm;

Why are these casts necessary?

> +
> +=09/* 2. Threshold logic: Deterministic safe-state */
> +=09if (raw_rpm < (long)max_t(u32, MIN_THRESHOLD_RPM, data->config->stop_=
threshold)) {

This should be doable with min() and without casts.

>  =09=09data->filtered_val[idx] =3D 0;
>  =09=09data->last_sample[idx] =3D now;
>  =09=09return;
>  =09}
> =20
> +=09/* 3. Auto-Reset Logic: Snap to hardware value after long gaps (>5s) =
*/

> +=09/*   Ref: [TAG: INIT_STATE, STALE_DATA_THRESHOLD] */

???

>  =09if (data->last_sample[idx] =3D=3D 0 || dt_ms > MAX_SAMPLING) {
>  =09=09data->filtered_val[idx] =3D raw_rpm;
>  =09=09data->last_sample[idx] =3D now;
>  =09=09return;
>  =09}
> =20
> -=09if (dt_ms < MIN_SAMPLING)
> -=09=09return;
> -
>  =09delta =3D raw_rpm - data->filtered_val[idx];
>  =09if (delta =3D=3D 0) {
>  =09=09data->last_sample[idx] =3D now;
>  =09=09return;
>  =09}
> =20
> +=09/* 4. Physics Engine: Discretized RLLAG filter (Fixed-Point 2^12) */

> +=09/* Ref: [TAG: MODEL_CONST, ALPHA_DERIVATION, ANTI_STALL_LOGIC] */

???

>  =09temp_num =3D dt_ms << 12;
> -=09alpha =3D (long)div64_s64(temp_num, (s64)(TAU_MS + dt_ms));
> +=09alpha =3D (long)div64_s64(temp_num, (s64)(data->internal_tau_ms + dt_=
ms));
>  =09step =3D (delta * alpha) >> 12;
> =20
> +=09/* Ensure minimal movement for small deltas */
>  =09if (step =3D=3D 0 && delta !=3D 0)
>  =09=09step =3D (delta > 0) ? 1 : -1;

Since this change is already big and messy, I suggest you make a separate=
=20
change for comment additions to the existing code.

> =20
> -=09limit =3D (MAX_SLEW_RPM_S * (long)dt_ms) / 1000;
> +=09/* 5. Dynamic Slew Limiting: Applied per-model inertia ramp */

> +=09/* Ref: [TAG: SLEW_RATE_MAX, SLOPE_CALC, MIN_SLEW_LIMIT] */

???

E.g. SLOPE_CALC doesn't appear in your patch more than once, nor in the=20
mainlike kernel. Please don't add useless/cryptic comments like this.

> +=09limit =3D ((long)data->internal_max_slew_rpm_s * (long)dt_ms) / 1000;

1000 should likely be converted to something in units.h

Shouldn't this use proper 64-bit divide interface? (A pre-existing=20
problem.)

>  =09if (limit < 1)
>  =09=09limit =3D 1;
> =20
> @@ -115,6 +178,7 @@ static void apply_rllag_filter(struct yoga_fan_data *=
data, int idx, long raw_rpm
>  =09else if (step < -limit)
>  =09=09step =3D -limit;
> =20
> +=09/* 6. Update internal state */
>  =09data->filtered_val[idx] +=3D step;
>  =09data->last_sample[idx] =3D now;
>  }
> @@ -123,19 +187,58 @@ static int yoga_fan_read(struct device *dev, enum h=
wmon_sensor_types type,
>  =09=09=09 u32 attr, int channel, long *val)
>  {
>  =09struct yoga_fan_data *data =3D dev_get_drvdata(dev);
> +=09const struct yogafan_config *cfg =3D data->config;
>  =09unsigned long long raw_acpi;
> +=09long rpm_raw;
>  =09acpi_status status;
> +=09s64 dt_ms;
> =20
> -=09if (type !=3D hwmon_fan || attr !=3D hwmon_fan_input)
> +=09if (type !=3D hwmon_fan)
>  =09=09return -EOPNOTSUPP;
> =20
> +=09/* 1. Handle static MAX attribute immediately without filtering */
> +=09if (attr =3D=3D hwmon_fan_max) {
> +=09=09*val =3D (long)data->device_max_rpm;

Please remove all unnecessary casts.

> +=09=09return 0;
> +=09}
> +
> +=09if (attr !=3D hwmon_fan_input)
> +=09=09return -EOPNOTSUPP;
> +
> +=09/* 2. Polling Protection */
> +=09dt_ms =3D ktime_to_ms(ktime_sub(ktime_get_boottime(), data->last_samp=
le[channel]));
> +
> +=09if (data->last_sample[channel] !=3D 0 && dt_ms < MIN_SAMPLING) {
> +=09=09*val =3D data->filtered_val[channel];
> +=09=09return 0;
> +=09}
> +
> +=09/* 3. Hardware Reading with AND fallback logic */
>  =09status =3D acpi_evaluate_integer(data->active_handles[channel], NULL,=
 NULL, &raw_acpi);
> +
> +=09/* If the first attempt fails AND there is a second handle for that c=
hannel, */
> +=09/* try the second one */
> +=09if (ACPI_FAILURE(status) && cfg->paths[channel + 1])
> +=09=09status =3D acpi_evaluate_integer(data->active_handles[channel + 1]=
,
> +=09=09=09=09=09       NULL, NULL, &raw_acpi);
> +
> +=09/* If it still fails after the fallback, return I/O error */
>  =09if (ACPI_FAILURE(status))
>  =09=09return -EIO;
> =20
> -=09apply_rllag_filter(data, channel, (long)raw_acpi * data->multiplier);
> -=09*val =3D data->filtered_val[channel];
> +=09/* 4. RPM Calculation  */
> +=09if (cfg->n_max > 0) {
> +=09=09/* Formula: (raw_acpi * device_max_rpm) / n_max */
> +=09=09/* mul_u64_u32_div handles the 64-bit precision internally */
> +=09=09rpm_raw =3D (long)mul_u64_u32_div(raw_acpi, data->device_max_rpm, =
cfg->n_max);
> +=09} else {
> +=09=09rpm_raw =3D (long)raw_acpi * cfg->multiplier;
> +=09}
> =20
> +=09/* 5. Apply filter on speed readings */
> +=09apply_rllag_filter(data, channel, rpm_raw);
> +
> +=09*val =3D data->filtered_val[channel];
>  =09return 0;
>  }
> =20
> @@ -155,84 +258,129 @@ static const struct hwmon_ops yoga_fan_hwmon_ops =
=3D {
>  =09.read =3D yoga_fan_read,
>  };
> =20
> -static const struct hwmon_channel_info *yoga_fan_info[] =3D {
> -=09HWMON_CHANNEL_INFO(fan,
> -=09=09=09   HWMON_F_INPUT, HWMON_F_INPUT,
> -=09=09=09   HWMON_F_INPUT, HWMON_F_INPUT,
> -=09=09=09   HWMON_F_INPUT, HWMON_F_INPUT,
> -=09=09=09   HWMON_F_INPUT, HWMON_F_INPUT),
> -=09NULL
> -};
> -
> -static const struct hwmon_chip_info yoga_fan_chip_info =3D {
> -=09.ops =3D &yoga_fan_hwmon_ops,
> -=09.info =3D yoga_fan_info,
> -};

=2E.. (see below)

>  static const struct dmi_system_id yogafan_quirks[] =3D {
> -=09{
> -=09=09.ident =3D "Lenovo Yoga",
> +/* --- 1. YOGA SERIES --- */
> +{
> +=09=09.ident =3D "Lenovo Yoga 14cACN (82N7)",
>  =09=09.matches =3D {
>  =09=09=09DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -=09=09=09DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "82N7")

These match changes are not justified by the changelog at all.

>  =09=09},
> -=09=09.driver_data =3D (void *)&yoga_8bit_fans_cfg,
> +=09=09.driver_data =3D (void *)&yoga_continuous_8bit_cfg,
>  =09},
> +
> +/* --- 3. LEGION SERIES --- */
>  =09{
> -=09=09.ident =3D "Lenovo Legion",
> +=09=09.ident =3D "Lenovo Legion 5 (82JW)",
>  =09=09.matches =3D {
>  =09=09=09DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -=09=09=09DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "82JW")
>  =09=09},
> -=09=09.driver_data =3D (void *)&legion_16bit_dual_cfg,
> +=09=09.driver_data =3D (void *)&legion_5_cfg,
>  =09},
> +
> +/* --- 5. IDEAPAD SERIES --- */
>  =09{
> -=09=09.ident =3D "Lenovo IdeaPad",
> +=09=09.ident =3D "Lenovo IdeaPad 5 (81YM)",
>  =09=09.matches =3D {
>  =09=09=09DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -=09=09=09DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "81YM")
>  =09=09},
> -=09=09.driver_data =3D (void *)&ideapad_8bit_fan0_cfg,
> +=09=09.driver_data =3D (void *)&yoga_continuous_8bit_cfg,
>  =09},
>  =09{ }
>  };
> +
>  MODULE_DEVICE_TABLE(dmi, yogafan_quirks);
> =20
> +/* Static configuration for the hwmon core */
> +static const struct hwmon_channel_info *const yoga_fan_info[] =3D {
> +=09HWMON_CHANNEL_INFO(fan,
> +=09=09=09   HWMON_F_INPUT | HWMON_F_MAX,
> +=09=09=09   HWMON_F_INPUT | HWMON_F_MAX,
> +=09=09=09   HWMON_F_INPUT | HWMON_F_MAX),
> +=09NULL
> +};
> +
> +static const struct hwmon_chip_info yoga_fan_chip_info =3D {
> +=09.ops =3D &yoga_fan_hwmon_ops,
> +=09.info =3D yoga_fan_info,
> +};

Moving stuff around in a feature change?

Please split this into series of patches, each patch properly justified=20
and doing one logical thing.

> +
>  static int yoga_fan_probe(struct platform_device *pdev)
>  {
>  =09const struct dmi_system_id *dmi_id;
>  =09const struct yogafan_config *cfg;
>  =09struct yoga_fan_data *data;
> -=09struct device *hwmon_dev;
> +=09acpi_status status;
>  =09int i;
> =20
> +=09/* Check for WMI interfaces that handle fan/thermal management. */
> +=09/*  If present, we yield to the WMI driver to prevent double-reportin=
g. */
> +=09if (wmi_has_guid(LENOVO_WMI_OTHER_MODE_GUID) &&
> +=09    wmi_has_guid(LENOVO_CAPABILITY_DATA_00_GUID) &&
> +=09    wmi_has_guid(LENOVO_WMI_FAN_GUID)) {
> +=09=09dev_info(&pdev->dev, "Lenovo WMI management interface detected; yi=
elding to WMI driver\n");

Missing header.

> +=09=09return -ENODEV;
> +=09}
> +
>  =09dmi_id =3D dmi_first_match(yogafan_quirks);
>  =09if (!dmi_id)
>  =09=09return -ENODEV;
> =20
>  =09cfg =3D dmi_id->driver_data;
> +

Stray change.

>  =09data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  =09if (!data)
>  =09=09return -ENOMEM;
> =20
> -=09data->multiplier =3D cfg->multiplier;
> -
> -=09for (i =3D 0; i < cfg->fan_count; i++) {
> -=09=09acpi_status status;
> -
> -=09=09status =3D acpi_get_handle(NULL, (char *)cfg->paths[i],
> -=09=09=09=09=09 &data->active_handles[data->fan_count]);
> -=09=09if (ACPI_SUCCESS(status))
> +=09/* * 1. Hardware Calibration & Inertia Scaling (Note 3):
> +=09 * Dynamic parameters (TAU and SLEW) are calibrated relative to fan d=
iameter
> +=09 * based on the moment of inertia relationship (J =E2=88=9D d=C2=B2).
> +=09 */
> +=09data->config =3D cfg;
> +=09data->device_max_rpm =3D cfg->r_max ?: 5000;
> +=09data->internal_tau_ms =3D cfg->tau_ms ?: 1000; /* Robustness: Prevent=
 zero-division */

Eh, you removed the 1000 define for TAU_MS and now you add it back as=20
literal. Please try to avoid avoid adding literals.

I don't think that comment adds value and is overly verbose as well.

> +
> +=09/* * Log physical parameters for safety traceability (IEC 61508):
> +=09 * Provides a deterministic baseline for the RLLag filter verificatio=
n.
> +=09 */
> +=09data->internal_max_slew_rpm_s =3D data->device_max_rpm / (cfg->slew_t=
ime_s ?: 1);

Literal 1 should use a named define.

> +=09dev_info(&pdev->dev, "Identified hardware: %s\n", dmi_id->ident);
> +=09dev_info(&pdev->dev, "HAL Profile: [Tau: %ums, Slew: %u RPM/s, Max: %=
u RPM]\n",
> +=09=09 data->internal_tau_ms, data->internal_max_slew_rpm_s, data->devic=
e_max_rpm);

The general convention is that probe should mostly be quiet when it=20
succeeds.

> +
> +=09/* * 2. Deterministic Multi-Path Discovery:

Extra *.

Add an empty comment line here.

> +=09 * We iterate through the available paths to find physical handles.
> +=09 * This loop tests variations until data->fan_count matches the
> +=09 * cfg->fan_count expected for this model profile.
> +=09 */
> +=09for (i =3D 0; i < MAX_FANS && data->fan_count < cfg->fan_count; i++) =
{
> +=09=09acpi_handle handle;
> +
> +=09=09/* Integrity check: End of defined paths in the quirk table */
> +=09=09if (!cfg->paths[i])
> +=09=09=09break;
> +
> +=09=09status =3D acpi_get_handle(NULL, cfg->paths[i], &handle);
> +=09=09if (ACPI_SUCCESS(status)) {
> +=09=09=09data->active_handles[data->fan_count] =3D handle;
>  =09=09=09data->fan_count++;
> +=09=09} else {
> +=09=09=09/* Log variation failure for troubleshooting */
> +=09=09=09dev_dbg(&pdev->dev, "Fan path variation %s not found\n", cfg->p=
aths[i]);
> +=09=09}
>  =09}
> =20
> -=09if (data->fan_count =3D=3D 0)
> +=09/* Integrity Check: Fail probe if no fans were successfully registere=
d */
> +=09if (data->fan_count =3D=3D 0) {
> +=09=09dev_err(&pdev->dev, "Hardware identification failed: No fans found=
\n");

An unrelated change.

>  =09=09return -ENODEV;
> +=09}
> =20
> -=09hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, DRVNAM=
E,
> -=09=09=09=09=09=09=09 data, &yoga_fan_chip_info, NULL);
> -
> -=09return PTR_ERR_OR_ZERO(hwmon_dev);
> +=09/* * 3. Finalize registration using the static template */
> +=09return PTR_ERR_OR_ZERO(devm_hwmon_device_register_with_info(&pdev->de=
v,
> +=09=09=09=09DRVNAME, data, &yoga_fan_chip_info, NULL));

The old way was way better. And this too looks entirely unrelated change.


This was extremely messy to review. Please only resubmit after splitting=20
this into a series which does only a single logical change per patch.

And right before doing the next submission, my suggestion is: please try=20
to review it yourself. If, while reviewing it yourself, you don't=20
understand something or feel need to skip reading some lines because the=20
change is so big or get messy, it will likely cause the same feeling for=20
the other reviewers as well and you should rethink the approach and ensure=
=20
you've really split it into manageable (reviewable) chunks.

--=20
 i.

--8323328-1651206713-1777373073=:1128--
