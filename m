Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E88370D52;
	Sat, 11 Apr 2026 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918218; cv=pass; b=JJ4bxFuIZjeyj2iAW5dJKIE3momo7piMAsPsgM+Cc8o7rknJkwesMk2eZT9J27iljop7JbU3k9dCO+vcTbNGCo8vxOTI9WKnD0bEZ/KMTeF/SBKIdKKOJdwG3GVmf25H6sSpNKyeiUVsI9kwy0WsHCwZKWUjoDaxz4VbP+gIQEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918218; c=relaxed/simple;
	bh=vlV+RbXrNNU59DJ2+4i6hSGP56fMQg62de4I8bGjB5Y=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cf4myE9/xVVkGhlsj+R2upWMQkaOyvrDuUJWdb7PlM+JTKHW1RDlhJ6oyZ0BdyW8b19cOLexj+WGjeb2ybaElBj5YBG26t62ZJJMg1xImRuIobImtGAiHjQ9TEyHmf70LOaP0oavfmYGdmid9MK9G+anoZpvCXG1W4o2I7qGuNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=fCoN8tHF; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="fCoN8tHF"
ARC-Seal: i=1; a=rsa-sha256; t=1775918193; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TYxPUO8v1F7bwDeOnEjDHdYBKrFxiZkdBC8RyUeTu70HWXxBWXgnI22F2lBtdGDGEB8zoO0Di+ELnZ3/7fnmJThOtjg9KzQQJ0DSHVHOe4c2SGaghVJWt6H+21YYNKf3mDLIKLi1kZFLJGnUgZDICZp9eiU522Jp+//4u9oqrck=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775918193; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CBJu+PWrTpqXWJCLNcBLOIuapE7A5yiSa0WPdbVWUNo=; 
	b=WxZUD/J1IQBX/tqTagy6JsuHUzBmkkDsDtOaghPWmbZuYDJgqzrl77NCoX32sIzr24pEtEIYtkW5lHATe2x67Ecu6JFor0vTjBzlRCIme6NUEe2lSOBJz3DKKzADzRDWPqns7enhKM51D+XFrtPj6QHtVV7ifflE29l5lbe5jB0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775918192;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=CBJu+PWrTpqXWJCLNcBLOIuapE7A5yiSa0WPdbVWUNo=;
	b=fCoN8tHFujhewc71zZ8J3kdfpr6Tlo6YPNy+CYMved2l05T3sp5g0G26f7yDMU0d
	/cvHTm440D/F1B7DnKctr6i6eqH1El6PCsm1+kBhH6+EG9F+miyuAgnCq6BcBhnvjfa
	68UELYt0lUtY2NxiL2a2BHkit266Zjw16+eIs4FxO3t2ZiBbxOvNGpe5VRKejVBsrGe
	JyOFxGfhJAiGsN8sDpsNk0sKp3/V08dSv9tjlM3tU0W0SNgpG5Pl/vx1xqN1GeRDQP8
	ychKUNtqqmZyvLtxvHFnk/cEH+ch0bDm2Ud3JNsHIEvDQaMGKWdSdEP/PqdN16HtEYI
	rcKe3MSLnA==
Received: by mx.zohomail.com with SMTPS id 1775918188909961.7234914497765;
	Sat, 11 Apr 2026 07:36:28 -0700 (PDT)
Message-ID: <4c627b63e40d1a3b2923ebe8b42fedde176f35cd.camel@rong.moe>
Subject: Re: [PATCH v14] Subject: [PATCH v14] hwmon: (yogafan) Extend
 support to more Lenovo consumer models
From: Rong Zhang <i@rong.moe>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, Jean Delvare	
 <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org,  platform-driver-x86
 <platform-driver-x86@vger.kernel.org>
In-Reply-To: <CAP8e=s+TcnikqHtTaXdsDUmOreLP5MYNQN1gDWvrQa-smbh_9w@mail.gmail.com>
References: <20260404164339.119023-1-sergiomelas@gmail.com>
	 <ae53b7783787975caa973dcde337f20aee9b0b40.camel@rong.moe>
	 <CAP8e=s+TcnikqHtTaXdsDUmOreLP5MYNQN1gDWvrQa-smbh_9w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Apr 2026 22:31:21 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Sergio,

On Fri, 2026-04-10 at 22:14 +0200, Sergio Melas wrote:
> Hi Rong, Hi Guenter,
>=20
> Thank you for the review and for pointing out the overlap with lenovo-wmi=
-other.
>=20
> 1. WMI Coexistence and Bogus Fans
> I completely agree that double-reporting is suboptimal. I will
> implement a check in the probe function using
> wmi_has_guid(LENOVO_WMI_FAN_GUID). If the WMI interface is present,
> yogafan will return -ENODEV and yield to your driver. This ensures my
> driver only covers models where WMI reporting is unavailable.=C2=A0
>=20

You may also want to add a module parameter to override the WMI GUID
check as some devices do not support the fan reporting/tuning interface
despite having the WMI GUIDs.

> I will
> also adjust the quirks for the ThinkBook 14 G7+ to avoid registering
> bogus fan handles.
>=20
> 2. New Submission Plan and Community Testing
> As requested by Guenter, I am preparing a fresh series starting from
> [PATCH v1] to provide a clean baseline. This will include the WMI
> back-off logic and the Aura Edition (83KF) support.
> However, I must be clear: I do not have physical access to the latest
> WMI-enabled hardware (like the ThinkBook G7+) to locally verify the
> back-off logic. I will provide the V1 with the implemented check, but
> I will have to rely on the community=E2=80=94and specifically Rong=E2=80=
=94to test and
> verify the behavior on affected models.

Thanks, I will test it and add a Tested-by: tag then.

>=20
> 3. Authorship and AI Assistance
> Regarding the Assisted-by: tag, I want to clarify that the driver
> architecture, the design of the RLLag filter, derived from my PhD
> research at: https://theses.fr/1998INPG0114, and the overall physical
> modeling logic are entirely my original work.
> Drawing on my automation background, I validated functional safety and
> cybersecurity integrity using a full Bow-Tie Risk Analysis and
> Traceability report (following IEC 61508, IEC 61511, and IEC 62443
> standards).

Awesome!

>  I utilized Gemini as a productivity tool for non-creative, repetitive
> tasks: specifically for generating the extensive DMI/ACPI mapping
> tables from DSDT data=C2=A0
>=20

I am a little curious about where you got so many DSDTs. I sometimes
need DSDTs from other devices for cross-reference. I didn't see a
reference in the documentation. Am I missing something?

> and community-driven reverse engineering of
> Lenovo Legion/LOQ EC memory maps at:
> https://github.com/hirschmann/nbfc/tree/master/Configs. The full
> development history, DSDT research, and hardware analysis are
> documented in my repository at:
> https://github.com/sergiomelas/lenovo-linux-drivers. I will include
> the tag in the next submission to be transparent about the tools used.
>=20
> Note: I will be traveling to China from April 15th to May 10th. My
> connectivity will be limited. I will monitor the mailing list via
> mobile roaming to address feedback,  but I will submit the new V1
> series early next week, prior to my departure.

Have a nice trip in China :-)

Thanks,
Rong

>=20
> Best regards,
>=20
> Sergio Melas
>=20
>=20
> On Fri, Apr 10, 2026 at 7:20=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
> >=20
> > (+CC pdx86 list, Armin, Derek)
> >=20
> > Hi Sergio,
> >=20
> > Thanks for developing this driver.
> >=20
> > On Sat, 2026-04-04 at 18:43 +0200, Sergio Melas wrote:
> > > Please disregard the previous V13 submission; the patch was malformed
> > > due to a header corruption issue during generation.
> > >=20
> > > This patch expands hardware compatibility for the yogafan driver from
> > > 3 families to 12, covering approximately 95% of the Lenovo consumer
> > > portfolio released between 2011 and 2026.
> > >=20
> > > Key improvements include:
> > > - Implementation of linear estimation for discrete Embedded Controlle=
rs.
> > > - A major architectural refactor to move physics constants into hardw=
are
> > >   profiles.
> > > - Safety fixes for divide-by-zero risks and filter state corruption.
> >=20
> > Derek and I recently noticed that the driver (more specifically, v11)
> > has appeared in hwmon-next. We haven't carefully reviewed the code, but
> > we have a minor concern.
> >=20
> > Some Legion/ThinkBook devices support reporting or tuning fan RPM via
> > the LENOVO_OTHER_MODE WMI interface. I've added hwmon support to the
> > lenovo-wmi-other driver to expose this capability:
> >=20
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/platform/x86/lenovo/wmi-other.c?h=3Dv7.0-rc7#n153
> > https://lore.kernel.org/all/20260120182104.163424-1-i@rong.moe/
> >=20
> > With yogafan and lenovo-wmi-other both enabled, there will be two hwmon
> > devices reporting the same metric (except for some temporary hysteresis
> > introduced by yogafan's RLLag filter).
> >=20
> > Ideally, it'd better not registering the same metric more than once.
> > From our perspective, lenovo-wmi-other should be preferred as it
> > provides tuning support, as well as min/max values directly from the
> > LENOVO_FAN_TEST_DATA interface.
> >=20
> > To address the issue, it should be enough to return -ENODEV on probe
> > when the WMI GUIDs of the LENOVO_OTHER_MODE and
> > LENOVO_CAPABILITY_DATA_00 interfaces are present. Alternatively, we may
> > introduce a coordinator driver to arbitrate between both drivers.
> >=20
> > That being said, I found no interference between the two driver during
> > my test [1], so double reporting is not a major blocker of yogafan from
> > my perspective.
> >=20
> > >=20
> > > Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> >=20
> > I have a faint intuition that the patch might be AI assisted. If that's
> > the case, please add an `Assisted-by:' tag accordingly. See also
> > https://docs.kernel.org/process/coding-assistants.html
> >=20
> > I also noticed that you mentioned ideapad-laptop in the documentation.
> > Since lenovo-wmi-other can provide the same metric on some devices, it
> > may deserve a mention too. For the same reason, could you kindly CC the
> > pdx86 list when you resubmit this?
> >=20
> > [1]: the test was against this patch (v14). I had to manually add a
> > device table entry for my device (ThinkBook 14 G7+ ASP) as the ACPI pat=
h
> > of its fan is \_SB.PCI0.LPC0.EC0.FA1S. \_SB.PCI0.LPC0.EC0.FA2S also
> > exists, but it's bogus -- that's why lenovo-wmi-other needs
> > LENOVO_FAN_TEST_DATA to hide bogus fans.
> >=20
> > Thanks,
> > Rong
> >=20
> > > ---
> > > I realize we are late in the current cycle and this expansion will ha=
ve to
> > > wait for the next merge window. I am submitting V13 now to address th=
e
> > > technical and safety concerns raised in the V12 review so the code is=
 ready
> > > when the next window opens.
> > >=20
> > > V14:
> > >   - Technical content identical to v13.
> > >   - Fixed malformed email headers and MIME/Subject corruption that pr=
evented patch application.
> > >=20
> > > v13: Complete Architectural Refactor & Safety Fixes
> > >   - Hardcoded Physics: Moved filter constants (Tau, Slew, Threshold) =
from
> > >     global defines into static hardware profiles within 'yogafan_conf=
ig'
> > >     to provide model-specific tuning and clear technical rationale.
> > >   - Eliminated Module Parameters: Removed all module_param inputs to =
comply
> > >     with subsystem guidelines and prevent runtime instability.
> > >   - Divide-by-Zero Protection: Implemented safety clamps (?: 1) in th=
e probe
> > >     calculation to ensure the denominator is never zero during initia=
lization.
> > >   - State Corruption Fix: Modified yoga_fan_read() to handle static _=
max
> > >     attribute requests at the entry point. This prevents userspace po=
lling
> > >     (e.g., KDE/Dashboards) from inadvertently triggering the RLLag fi=
lter
> > >     and corrupting the last_sample timestamp.
> > >   - Sysfs Sanitation: Deleted custom attribute groups and non-standar=
d _raw
> > >     files; switched to standard HWMON core registration.
> > >   - Clean Probing: Refactored the ACPI path discovery loop to a simpl=
ified
> > >     conditional for loop and removed unnecessary (void *) type casts.
> > >   - Documentation Sync: Updated yogafan.rst to include secondary ACPI=
 paths
> > >     (.FANS) for Yoga 3/11s models to match the driver's probing logic=
.
> > >=20
> > > v12: Expanded Architecture & Universal Coverage (Rejected)
> > >   - Implemented Discrete Level Architecture (Linear Estimation) using=
 the formula
> > >     raw_RPM =3D (Rmax * IN) / Nmax to support legacy and ultra-portab=
le models
> > >     reporting fixed PWM steps.
> > >   - Added specific DMI-based quirks for Yoga 710, 720, 510, IdeaPad 5=
00S, U31-70,
> > >     and Yoga 2/3 series to utilize the new estimation logic.
> > >   - Expanded ACPI path probing to include "FAN0", "FA2S", and "FANS" =
handles,
> > >     ensuring out-of-the-box compatibility for ThinkBook G6 and LOQ se=
ries.
> > >   - Integrated the RLLag filter with discrete steps, mathematically s=
moothing
> > >     abrupt level jumps into a continuous physical RPM curve.
> > >   - Refactored driver to store filter constants (Tau, Slew) per-devic=
e,
> > >     enabling dynamic synchronization with model-specific maximum RPMs=
.
> > >   - Updated Documentation/hwmon/yogafan.rst with the validated Master
> > >     HAL Reference Database (2026).
> > >   - Expanded support from 3 to 12 distinct hardware families, coverin=
g over
> > >     450 unique models and 95% of Lenovo's consumer portfolio (2011=E2=
=80=932026).
> > >   - Fixed Documentation formatting, now table appear correctly.
> > >=20
> > > V11: Multirate Filter & Autoreset Logic
> > >   - Mapped ACPI paths directly via DMI quirks.
> > >   - Fixed Documentation formatting (0-day robot warnings).
> > >   - Implemented 100ms MIN_SAMPLING to address rapid polling concerns.
> > >   - Removed redundant platform_set_drvdata() in probe.
> > >   - Already Supported Models: Yoga 14c, Slim 7, Pro 7, Pro 9, Legion =
5, Legion 7i, LOQ.
> > >=20
> > > v9/10:RLLag V1 Physics & Multiplier Fix
> > >   - Implement ACPI handle resolution during probe for better performa=
nce (O(1) read).
> > >   - Add MODULE_DEVICE_TABLE(dmi, ...) to enable module autoloading.
> > >   - Refine RLLag filter documentation and suspend/resume logic.
> > >   - Include comprehensive EC architecture research database (8-bit vs=
 16-bit).
> > >   - Validated efficiency on kernels 6.18, 6.19, and 7.0-rc5: 'perf to=
p'
> > >     confirms negligible CPU overhead (<0.01%) during active polling.
> > > V08: ACPI Handle Discovery & Initial Probe
> > >   - Replaced heuristic multiplier with deterministic DMI Quirk Table.
> > >   - Added 'depends on DMI' to Kconfig.
> > >   - Verified FOPTD model (1000ms TAU / 1500 RPM/s slew) against hardw=
are traces.
> > >   - Increased filter precision to 12-bit fixed-point.
> > > V07: DMI Quirk Table & Device Identification
> > >   - Fixed Kconfig: Removed non-existent 'select MATH64'.
> > >   - Fixed unused macro: Utilized RPM_FLOOR_LIMIT to implement an
> > >     immediate 0-RPM bypass in the filter.
> > >   - Clarification: Previous "unified structure" comment meant that al=
l
> > >     6 files (driver, docs, metadata) are now in this single atomic pa=
tch.
> > > V06: Dual-Fan Support & ACPI Handle Eval
> > >   - Unified patch structure (6 files changed).
> > >   - Verified FOPTD (First-Order Plus Time Delay) model against hardwa=
re
> > >       traces (Yoga 14c) to ensure physical accuracy of the 1000ms tim=
e constant.
> > >   - Fixed a rounding stall: added a +/- 1 RPM floor to the step calcu=
lation
> > >     to ensure convergence even at high polling frequencies.
> > >   - Set MAX_SLEW_RPM_S to 1500 to match physical motor inertia.
> > >   - Documentation: Updated to clarify 100-RPM hardware step resolutio=
n.
> > >   - 32-bit safety: Implemented div64_s64 for coefficient precision.
> > > V05: Raw EC Register Offset Validation
> > >   - Fixed 32-bit build failures by using div64_s64 for 64-bit divisio=
n.
> > >   - Extracted magic numbers into constants (RPM_UNIT_THRESHOLD, etc.)=
.
> > >   - Fixed filter stall by ensuring a minimum slew limit (limit =3D 1)=
.
> > >   - Refined RPM floor logic to trigger only when hardware reports 0 R=
PM.
> > >   - Resolved 255/256 unit-jump bug by adjusting heuristic thresholds.
> > > v04: Initial HWMON Sysfs Implementation
> > >   - Rebased on groeck/hwmon-next branch for clean application.
> > >   - Corrected alphabetical sorting in Kconfig and Makefile.
> > >   - Technical Validation & FOPTD Verification:
> > >     - Implemented RLLag (Rate-Limited Lag) first-order modeling.
> > >     - Used 10-bit fixed-point math for alpha calculation to avoid
> > >       floating point overhead in the kernel.
> > >     - Added 5000ms filter reset for resume/long-polling sanitation.
> > > V03: DSDT Analysis & ACPI Path Mapping
> > >   - Added MAINTAINERS entry and full Documentation/hwmon/yogafan.rst.
> > >   - Fixed integer overflow in filter math.
> > >   - Added support for secondary fan paths (FA2S) for Legion laptops.
> > > V02: Proof-of-Concept Embedded Controller Reads
> > >   - Migrated from background worker to passive multirate filtering.
> > >   - Implemented dt-based scaling to maximize CPU sleep states.
> > >   - Restricted driver to Lenovo hardware via DMI matching.
> > > V01: Initial Module Skeleton & Kbuild Setup
> > >   - Initial submission with basic ACPI fan path support.
> > > ---
> > > ---
> > >  Documentation/hwmon/yogafan.rst | 293 ++++++++++++++++++++----
> > >  drivers/hwmon/Kconfig           |   1 -
> > >  drivers/hwmon/yogafan.c         | 381 +++++++++++++++++++++++++++---=
--
> > >  3 files changed, 571 insertions(+), 104 deletions(-)
> > >=20
> > > diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yo=
gafan.rst
> > > index c0a449aa8..eb5534fb8 100644
> > > --- a/Documentation/hwmon/yogafan.rst
> > > +++ b/Documentation/hwmon/yogafan.rst
> > > @@ -1,56 +1,186 @@
> > >  .. SPDX-License-Identifier: GPL-2.0-only
> > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >  Kernel driver yogafan
> > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +The yogafan driver provides fan speed monitoring for Lenovo consumer=
 laptops (Yoga, Legion, IdeaPad)
> > > +by interfacing with the Embedded Controller (EC) via ACPI, implement=
ing a Rate-Limited Lag (RLLag)
> > > +filter to ensure smooth and physically accurate RPM telemetry.
> > >=20
> > >  Supported chips:
> > > +----------------
> > > +
> > > +  * YOGA & SLIM SERIES (8-bit / Discrete Logic)
> > > +    - Yoga 14cACN, 14s, 13 (including Aura Edition)
> > > +    - Yoga Slim 7, 7i, 7 Pro, 7 Carbon
> > > +    - Yoga Pro 7, 9 (83E2, 83DN)
> > > +    - Yoga 710, 720, 510 (Discrete Step Logic)
> > > +    - Yoga 3 14, 11s, Yoga 2 13 (Discrete Step Logic)
> > > +    - Xiaoxin Pro, Air, 14, 16 (All PRC/Chinese Variants)
> > > +
> > > +  * LEGION, LOQ & G-SERIES (16-bit High-Precision Raw)
> > > +    - Legion 5, 5i, 5 Pro (AMD & Intel 82JW/82JU)
> > > +    - Legion 7, 7i, 7 Slim (82WQ)
> > > +    - LOQ 15, 16 (82XV, 83DV)
> > > +    - GeekPro G5000, G6000 (PRC Gaming Series)
> > > +
> > > +  * IDEAPAD & FLEX SERIES (8-bit / Discrete Logic)
> > > +    - IdeaPad 5, 5i, 5 Pro (81YM, 82FG)
> > > +    - IdeaPad 3, 3i (Modern 8-bit variants)
> > > +    - IdeaPad 500S, U31-70 (Discrete Step Logic)
> > > +    - Flex 5, 5i (81X1)
> > > +
> > > +  * THINKBOOK, V-SERIES & LEGACY (Discrete Logic)
> > > +    - ThinkBook G6, G7 (83AK)
> > > +    - V330-15IKB, V580
> > > +    - Legacy U-Series (U330p, U430p)
> > >=20
> > > -  * Lenovo Yoga, Legion, IdeaPad, Slim, Flex, and LOQ Embedded Contr=
ollers
> > >      Prefix: 'yogafan'
> > > -    Addresses: ACPI handle (See Database Below)
> > > +
> > > +    Addresses: ACPI handle (DMI Quirk Table Fallback)
> > > +
> > > +    Datasheet: Not available; based on ACPI DSDT and EC reverse engi=
neering.
> > >=20
> > >  Author: Sergio Melas <sergiomelas@gmail.com>
> > >=20
> > >  Description
> > >  -----------
> > >=20
> > > -This driver provides fan speed monitoring for modern Lenovo consumer=
 laptops.
> > > -Most Lenovo laptops do not provide fan tachometer data through stand=
ard
> > > -ISA/LPC hardware monitoring chips. Instead, the data is stored in th=
e
> > > -Embedded Controller (EC) and exposed via ACPI.
> > > +This driver provides fan speed monitoring for a wide range of Lenovo=
 consumer
> > > +laptops. Unlike standard ThinkPads, these models do not use the 'thi=
nkpad_acpi'
> > > +interface for fan speed but instead store fan telemetry in the Embed=
ded
> > > +Controller (EC).
> > > +
> > > +The driver interfaces with the ACPI namespace to locate the fan tach=
ometer
> > > +objects. If the ACPI path is not standard, it falls back to a machin=
e-specific
> > > +quirk table based on DMI information.
> > > +
> > > +This driver covers over 95% of Lenovo's consumer and ultra-portable =
laptop portfolio
> > > +released between 2011 and 2026, providing a unified hardware abstrac=
tion layer for diverse
> > > +Embedded Controller (EC) architectures.
> > > +
> > > +The driver exposes the RLLag  physical filter parameters (time const=
ant and slew-rate limit) in SI units (seconds),
> > > +dynamically synchronizing them with the specific model's maximum RPM=
 to ensure a consistent physical response
> > > +across the entire Lenovo product stack.
> > > +
> > > +Filter Physics (RLLag )
> > > +--------------------------
> > > +
> > > +To address low-resolution tachometer sampling in the Embedded Contro=
ller,
> > > +the driver implements a passive discrete-time first-order lag filter
> > > +with slew-rate limiting.
> > > +
> > > +* Multirate Filtering: The filter adapts to the sampling time (dt) o=
f the
> > > +  userspace request.
> > > +* Discrete Logic: For older models (e.g., Yoga 710), it estimates RP=
M based
> > > +  on discrete duty-cycle steps.
> > > +* Continuous Logic: For modern models (e.g., Legion), it maps raw hi=
gh-precision
> > > +  units to RPM.
> > >=20
> > >  The driver implements a **Rate-Limited Lag (RLLag)** filter to handl=
e
> > > -the low-resolution and jittery sampling found in Lenovo EC firmware.
> > > +low-resolution sampling in Lenovo EC firmware. The update equation i=
s:
> > > +
> > > +    **RPM_state[t+1] =3D RPM_state[t] + Clamp(Alpha * (raw_RPM[t] - =
RPM_state[t]), -limit[t], limit[t])**
> > > +
> > > +    Where:
> > > +
> > > +*   Time delta between reads:
> > > +
> > > +       **Ts[t]    =3D Sys_time[t+1] - Sys_time[t]**
> > > +
> > > +*   Low-pass smoothing factor
> > > +
> > > +       **Alpha    =3D 1 - exp(-Ts[t] / Tau)**
> > > +
> > > +*   Time-normalized slew limit
> > > +
> > > +       **limit[t] =3D MAX_SLEW_RPM_S * Ts[t]**
> > > +
> > > +To avoid expensive floating-point exponential calculations in the ke=
rnel,
> > > +we use a first-order Taylor/Bilinear approximation:
> > > +
> > > +       **Alpha =3D Ts / (Tau + Ts)**
> > > +
> > > +Implementing this in the driver state machine:
> > > +
> > > +*   Next step filtered RPM:
> > > +       **RPM_state[t+1] =3D RPM_new**
> > > +*   Current step filtered RPM:
> > > +       **RPM_state[t]   =3D RPM_old**
> > > +*   Time step Calculation:
> > > +       **Ts             =3D current_time - last_sample_time**
> > > +*   Alpha Calculation:
> > > +       **Alpha           =3D Ts / (Tau + Ts)**
> > > +*   RPM  step Calculation:
> > > +       **step           =3D Alpha * (raw_RPM -  RPM_old)**
> > > +*   Limit  step Calculation:
> > > +       **limit           =3D MAX_SLEW_RPM_S * Ts**
> > > +*   RPM physical step Calculation:
> > > +       **step_clamped   =3D clamp(step, -limit, limit)**
> > > +*   Update of RPM
> > > +       **RPM_new        =3D RPM_old + step_clamped**
> > > +*   Update internal state
> > > +       **RPM_old        =3D RPM_new**
> > > +
> > > +The input of the filter (raw_RPM) is derived from the EC using the l=
ogic defined in the
> > > +HAL section below.
> > > +
> > > +The driver exposes the RLLag  physical filter parameters (time const=
ant and slew-rate limit)
> > > +in SI units (seconds), dynamically synchronizing them with the speci=
fic model's maximum RPM
> > > +to ensure a consistent physical response across the entire Lenovo pr=
oduct stack.
> > > +
> > > +This approach inshures that the RLLag filter is a passive discrete-t=
ime first-order lag model:
> > > +  - **Smoothing:** Low-resolution step increments are smoothed into =
1-RPM increments.
> > > +  - **Slew-Rate Limiting:** Prevents unrealistic readings by capping=
 the change
> > > +    to 1500 RPM/s, matching physical fan inertia.
> > > +  - **Polling Independence:** The filter math scales based on the ti=
me delta
> > > +    between userspace reads, ensuring a consistent physical curve re=
gardless
> > > +    of polling frequency.
> > >=20
> > >  Hardware Identification and Multiplier Logic
> > >  --------------------------------------------
> > >=20
> > > -The driver supports two distinct EC architectures. Differentiation i=
s handled
> > > +The driver supports three distinct EC architectures. Differentiation=
 is handled
> > >  deterministically via a DMI Product Family quirk table during the pr=
obe phase,
> > >  eliminating the need for runtime heuristics.
> > >=20
> > > +Continuous RPM Reads
> > > +~~~~~~~~~~~~~~~~~~~~
> > > +
> > >  1. 8-bit EC Architecture (Multiplier: 100)
> > > -   - **Families:** Yoga, IdeaPad, Slim, Flex.
> > > +   - **Families:** Yoga, IdeaPad, Slim, Flex, Xiaoxin.
> > >     - **Technical Detail:** These models allocate a single 8-bit regi=
ster for
> > >     tachometer data. Since 8-bit fields are limited to a value of 255=
, the
> > >     BIOS stores fan speed in units of 100 RPM (e.g., 42 =3D 4200 RPM)=
.
> > >=20
> > >  2. 16-bit EC Architecture (Multiplier: 1)
> > > -   - **Families:** Legion, LOQ.
> > > +   - **Families:** Legion, LOQ, GeekPro.
> > >     - **Technical Detail:** High-performance gaming models require gr=
eater
> > >     precision for fans exceeding 6000 RPM. These use a 16-bit word (2=
 bytes)
> > >     storing the raw RPM value directly.
> > >=20
> > > -Filter Details:
> > > ----------------
> > > +Discrete RPM Reads
> > > +~~~~~~~~~~~~~~~~~~
> > >=20
> > > -The RLLag filter is a passive discrete-time first-order lag model th=
at ensures:
> > > -  - **Smoothing:** Low-resolution step increments are smoothed into =
1-RPM increments.
> > > -  - **Slew-Rate Limiting:** Prevents unrealistic readings by capping=
 the change
> > > -    to 1500 RPM/s, matching physical fan inertia.
> > > -  - **Polling Independence:** The filter math scales based on the ti=
me delta
> > > -    between userspace reads, ensuring a consistent physical curve re=
gardless
> > > -    of polling frequency.
> > > +3. Discrete Level Architecture (Linear Estimation)
> > > +   - **Families:** Yoga 710/510/13, IdeaPad 500S, Legacy U-Series.
> > > +   - **Technical Detail:** Older or ultra-portable EC firmware does =
not store
> > > +   a real-time tachometer value. Instead, it operates on a fixed num=
ber of
> > > +   discrete PWM states (Nmax). The driver translates these levels in=
to an
> > > +   estimated physical RPM using the following linear mapping:
> > > +
> > > +     raw_RPM =3D (Rmax * IN) / Nmax
> > > +
> > > +     Where:
> > > +     - IN:   Current discrete level read from the EC.
> > > +     - Nmax: Maximum number of steps defined in the BIOS (e.g., 59, =
255).
> > > +     - Rmax: Maximum physical RPM of the fan motor at full duty cycl=
e.
> > > +
> > > +   - **Filter Interaction:** Because these hardware reads jump abrup=
tly
> > > +     between levels (e.g., from level 4 to 5), the RLLag filter is e=
ssential
> > > +     here to simulate mechanical acceleration, smoothing the transit=
ion
> > > +     for the final fanX_input attribute.
> > >=20
> > >  Suspend and Resume
> > >  ------------------
> > > @@ -68,31 +198,11 @@ The driver exposes standard hwmon sysfs attribut=
es:
> > >  Attribute         Description
> > >  fanX_input        Filtered fan speed in RPM.
> > >=20
> > > -
> > >  Note: If the hardware reports 0 RPM, the filter is bypassed and 0 is=
 reported
> > >  immediately to ensure the user knows the fan has stopped.
> > >=20
> > > -
> > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > -                 LENOVO FAN CONTROLLER: MASTER REFERENCE DATABASE (2=
026)
> > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > -
> > > -MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PAT=
H          | WIDTH  | MULTiplier
> > > ---------------------------------------------------------------------=
--------------------------------
> > > -82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.F=
ANS        |  8-bit | 100
> > > -80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.F=
AN0        |  8-bit | 100
> > > -83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.F=
ANS        |  8-bit | 100
> > > -82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.F=
ANS        |  8-bit | 100
> > > -81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.F=
AN0        |  8-bit | 100
> > > -82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.F=
ANS (Fan1) | 16-bit | 1
> > > -82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.F=
A2S (Fan2) | 16-bit | 1
> > > -82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.F=
ANS (Fan1) | 16-bit | 1
> > > -82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.F=
A2S (Fan2) | 16-bit | 1
> > > -82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.F=
ANS /FA2S  | 16-bit | 1
> > > -83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.F=
AN0        |  8-bit | 100
> > > -81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.F=
AN0        |  8-bit | 100
> > > -*Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN=
0          |  8-bit | 100
> > > ---------------------------------------------------------------------=
--------------------------------
> > > +Lenovo Fan HAL
> > > +--------------
> > >=20
> > >  METHODOLOGY & IDENTIFICATION:
> > >=20
> > > @@ -109,6 +219,103 @@ METHODOLOGY & IDENTIFICATION:
> > >     - 8-bit (Multiplier 100): Standard for Yoga/IdeaPad. Raw values (=
0-255).
> > >     - 16-bit (Multiplier 1): Standard for Legion/LOQ. Two registers (=
0xFE/0xFF).
> > >=20
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > +LENOVO FAN CONTROLLER Hardware Abstraction Layer
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > +
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| MODEL       | FAMILY / SERIES   |  OFFSET | FULL ACPI OBJECT PATH =
         | WIDTH  | NMAX  | RMAX  | MULT |
> > > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
+=3D=3D=3D=3D=3D=3D+
> > > +| 82N7        | Yoga 14cACN       | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
S        | 8-bit  | 0     | 5500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 80V2 / 81C3 | Yoga 710/720      | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 59    | 4500  | 0    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 83E2 / 83DN | Yoga Pro 7/9      | 0xFE    | \_SB.PCI0.LPC0.EC0.FAN=
S        | 8-bit  | 0     | 6000  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 82A2 / 82A3 | Yoga Slim 7       | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
S        | 8-bit  | 0     | 5500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 81YM / 82FG | IdeaPad 5         | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 0     | 4500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 80S7        | Yoga 510          | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 41    | 4500  | 0    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 81AX        | V330-15IKB        | 0x95    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 116   | 4200  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 82JW / 82JU | Legion 5 (AMD)    | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FAN=
S (Fan1) | 16-bit | 0     | 6500  | 1    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 82JW / 82JU | Legion 5 (AMD)    | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FA2=
S (Fan2) | 16-bit | 0     | 6500  | 1    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 82WQ        | Legion 7i (Int)   | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FAN=
S (Fan1) | 16-bit | 0     | 8000  | 1    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 82WQ        | Legion 7i (Int)   | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FA2=
S (Fan2) | 16-bit | 0     | 8000  | 1    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 82XV / 83DV | LOQ 15/16         | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FAN=
S (Fan1) | 16-bit | 0     | 6500  | 1    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 82XV / 83DV | LOQ 15/16         | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FA2=
S (Fan2) | 16-bit | 0     | 6500  | 1    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 83AK        | ThinkBook G6      | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 0     | 5400  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 81X1        | Flex 5            | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 0     | 4500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 80SR / 80SX | IdeaPad 500S-13   | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 44    | 5500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 80S1        | IdeaPad 500S-14   | 0x95    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 116   | 5000  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 80TK        | IdeaPad 510S      | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 41    | 5100  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 80S9        | IdeaPad 710S      | 0x95/98 | \_SB.PCI0.LPC0.EC0.FAN=
1/2      | 8-bit  | 72    | 5200  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 80KU        | U31-70            | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 44    | 5500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 80S1        | U41-70            | 0x95    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 116   | 5000  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 80JH        | Yoga 3 14         | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
0/.FANS  | 8-bit  | 80    | 5000  | 0    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 20344       | Yoga 2 13         | 0xAB    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 8     | 4200  | 0    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 2191 / 20191| Yoga 13           | 0xF2/F3 | \_SB.PCI0.LPC0.EC0.FAN=
1/2      | 8-bit  | 255   | 5000  | 0    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| Legacy      | Yoga 11s          | 0x56    | \_SB.PCI0.LPC0.EC0.FAN=
0/.FANS  | 8-bit  | 80    | 4500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 20GJ / 20GK | ThinkPad 13       | 0x85    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 7     | 5500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 1143        | ThinkPad E520     | 0x95    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 100   | 4200  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 3698        | ThinkPad Helix    | 0x2F    | \_SB.PCI0.LPC0.EC0.FAN=
S        | 8-bit  | 7     | 4500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 20M7 / 20M8 | ThinkPad L380     | 0x95    | \_SB.PCI0.LPC0.EC0.FAN=
1        | 8-bit  | 52    | 4600  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 20NR / 20NS | ThinkPad L390     | 0x95    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 64    | 5500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 2464 / 2468 | ThinkPad L530     | 0x95    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 75    | 4400  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 2356        | ThinkPad T430s    | 0x2F    | \_SB.PCI0.LPC0.EC0.FAN=
S        | 8-bit  | 7     | 5000  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 20AQ / 20AR | ThinkPad T440s    | 0x4E    | \_SB.PCI0.LPC0.EC0.FAN=
S        | 8-bit  | 7     | 5200  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 20BE / 20BF | ThinkPad T540p    | 0x2F    | \_SB.PCI0.LPC0.EC0.FAN=
S        | 8-bit  | 7     | 5500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 3051        | ThinkPad x121e    | 0x2F    | \_SB.PCI0.LPC0.EC0.FAN=
S        | 8-bit  | 7     | 4500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 4290        | ThinkPad x220i    | 0x2F    | \_SB.PCI0.LPC0.EC0.FAN=
S        | 8-bit  | 7     | 5000  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| 2324 / 2325 | ThinkPad x230     | 0x2F    | \_SB.PCI0.LPC0.EC0.FAN=
S        | 8-bit  | 7     | 5000  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| Legacy      | IdeaPad Y580      | 0x06    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 95    | 5200  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| Legacy      | IdeaPad V580      | 0x95    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 100   | 5000  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| Legacy      | U160              | 0x95    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 8-bit  | 64    | 4500  | 100  |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +| Legacy      | U330p/U430p       | 0x92    | \_SB.PCI0.LPC0.EC0.FAN=
0        | 16-bit | 768   | 5000  | 0    |
> > > ++-------------+-------------------+---------+-----------------------=
---------+--------+-------+-------+------+
> > > +
> > > +Note for the  raw_RPM we have 2 cases:
> > > +
> > > +* Discrete Level Estimation
> > > +    **Nmax > 0 then raw_RPM =3D (Rmax * IN) / Nmax**
> > > +
> > > +* Continuous Unit Mapping
> > > +    **Nmax =3D 0 then raw_RPM =3D IN * Multiplier**
> > >=20
> > >  References
> > >  ----------
> > > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > > index 0081dd097..f1b89bf45 100644
> > > --- a/drivers/hwmon/Kconfig
> > > +++ b/drivers/hwmon/Kconfig
> > > @@ -2673,7 +2673,6 @@ config SENSORS_YOGAFAN
> > >         This driver can also be built as a module. If so, the module
> > >         will be called yogafan.
> > >=20
> > > -
> > >  config SENSORS_INTEL_M10_BMC_HWMON
> > >       tristate "Intel MAX10 BMC Hardware Monitoring"
> > >       depends on MFD_INTEL_M10_BMC_CORE
> > > diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> > > index 605cc928f..ee6ba5812 100644
> > > --- a/drivers/hwmon/yogafan.c
> > > +++ b/drivers/hwmon/yogafan.c
> > > @@ -24,6 +24,7 @@
> > >  #include <linux/platform_device.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/math64.h>
> > > +#include <linux/hwmon-sysfs.h>
> > >=20
> > >  /* Driver Configuration Constants */
> > >  #define DRVNAME                      "yogafan"
> > > @@ -37,37 +38,123 @@
> > >=20
> > >  /* RPM Sanitation Constants */
> > >  #define RPM_FLOOR_LIMIT              50      /* Snap filtered value =
to 0 if raw is 0 */
> > > +#define MIN_THRESHOLD_RPM    10      /* Minimum safety floor for per=
-model stop thresholds */
> > >=20
> > >  struct yogafan_config {
> > > -     int multiplier;
> > > -     int fan_count;
> > > -     const char *paths[2];
> > > +     int multiplier;                 /* Used if n_max =3D=3D 0 */
> > > +     int fan_count;                  /* 1 or 2 */
> > > +     int n_max;                      /* Discrete steps (0 =3D Contin=
uous) */
> > > +     int r_max;                      /* Max physical RPM for estimat=
ion */
> > > +     unsigned int tau_ms;            /* To store the smoothing speed=
    */
> > > +     unsigned int slew_time_s;       /* To store the acceleration li=
mit */
> > > +     unsigned int stop_threshold;    /* To store the RPM floor */
> > > +     const char *paths[2];           /* Paths */
> > >  };
> > >=20
> > >  struct yoga_fan_data {
> > >       acpi_handle active_handles[MAX_FANS];
> > >       long filtered_val[MAX_FANS];
> > > +     long raw_val[MAX_FANS];
> > >       ktime_t last_sample[MAX_FANS];
> > > -     int multiplier;
> > > +     const struct yogafan_config *config;
> > >       int fan_count;
> > > +     /* Per-device physics constants */
> > > +     unsigned int internal_tau_ms;
> > > +     unsigned int internal_max_slew_rpm_s;
> > > +     unsigned int device_max_rpm;
> > >  };
> > >=20
> > >  /* Specific configurations mapped via DMI */
> > > -static const struct yogafan_config yoga_8bit_fans_cfg =3D {
> > > -     .multiplier =3D 100,
> > > -     .fan_count =3D 1,
> > > -     .paths =3D { "\\_SB.PCI0.LPC0.EC0.FANS", NULL }
> > > +//* --- CONTINUOUS PROFILES (Nmax =3D 0) --- */
> > > +
> > > +/* Standard 8-bit Yoga/IdeaPad (Covers 82N7, Slim 7, etc.) */
> > > +static struct yogafan_config yoga_continuous_8bit_cfg =3D {
> > > +     .multiplier =3D 100, .fan_count =3D 1, .n_max =3D 0,
> > > +     .r_max =3D 5500,  /* Verified 14cACN peak */
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > > +     .paths =3D { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.F=
AN0" }
> > > +};
> > > +
> > > +/* Legion / LOQ Gaming (2 Fans, Raw RPM 16-bit) */
> > > +static struct yogafan_config legion_continuous_16bit_cfg =3D {
> > > +     .multiplier =3D 1, .fan_count =3D 2, .n_max =3D 0,
> > > +     .r_max =3D 6500,  /* Standard Legion/LOQ peak */
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > > +     .paths =3D { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.F=
A2S" }
> > > +};
> > > +
> > > +/* --- DISCRETE ESTIMATION PROFILES (NMAX > 0) --- */
> > > +
> > > +/* Yoga 710/720 (N=3D59) */
> > > +static struct yogafan_config yoga_710_discrete_cfg =3D {
> > > +     .multiplier =3D 0, .fan_count =3D 1, .n_max =3D 59, .r_max =3D =
4500,
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > > +     .paths =3D { "\\_SB.PCI0.LPC0.EC0.FAN0", NULL }
> > > +};
> > > +
> > > +/* Yoga 510 / Ideapad 510s (N=3D41) */
> > > +static struct yogafan_config yoga_510_discrete_cfg =3D {
> > > +     .multiplier =3D 0, .fan_count =3D 1, .n_max =3D 41, .r_max =3D =
4500,
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > > +     .paths =3D { "\\_SB.PCI0.LPC0.EC0.FAN0", NULL }
> > >  };
> > >=20
> > > -static const struct yogafan_config ideapad_8bit_fan0_cfg =3D {
> > > -     .multiplier =3D 100,
> > > -     .fan_count =3D 1,
> > > +/* Ideapad 500S / U31-70 (N=3D44) */
> > > +static struct yogafan_config ideapad_500s_discrete_cfg =3D {
> > > +     .multiplier =3D 0, .fan_count =3D 1, .n_max =3D 44, .r_max =3D =
5500,
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > >       .paths =3D { "\\_SB.PCI0.LPC0.EC0.FAN0", NULL }
> > >  };
> > >=20
> > > -static const struct yogafan_config legion_16bit_dual_cfg =3D {
> > > -     .multiplier =3D 1,
> > > -     .fan_count =3D 2,
> > > +/* Yoga 3 14 / Yoga 11s (N=3D80) */
> > > +static struct yogafan_config yoga3_14_discrete_cfg =3D {
> > > +     .multiplier =3D 0, .fan_count =3D 1, .n_max =3D 80, .r_max =3D =
5000,
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > > +     .paths =3D { "\\_SB.PCI0.LPC0.EC0.FAN0", "\\_SB.PCI0.LPC0.EC0.F=
ANS" }
> > > +};
> > > +
> > > +/* Yoga 2 13 (N=3D8) */
> > > +static struct yogafan_config yoga2_13_discrete_cfg =3D {
> > > +     .multiplier =3D 0, .fan_count =3D 1, .n_max =3D 8, .r_max =3D 4=
200,
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > > +     .paths =3D { "\\_SB.PCI0.LPC0.EC0.FAN0", NULL }
> > > +};
> > > +
> > > +/* Yoga 13 (N=3D255) - Dual Fan */
> > > +static struct yogafan_config yoga13_discrete_cfg =3D {
> > > +     .multiplier =3D 0, .fan_count =3D 2, .n_max =3D 255, .r_max =3D=
 5000,
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > > +     .paths =3D { "\\_SB.PCI0.LPC0.EC0.FAN1", "\\_SB.PCI0.LPC0.EC0.F=
AN2" }
> > > +};
> > > +
> > > +/* Legacy U330p/U430p (N=3D768) */
> > > +static struct yogafan_config legacy_u_discrete_cfg =3D {
> > > +     .multiplier =3D 0, .fan_count =3D 1, .n_max =3D 768, .r_max =3D=
 5000,
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > > +     .paths =3D { "\\_SB.PCI0.LPC0.EC0.FAN0", NULL }
> > > +};
> > > +
> > > +/* ThinkPad 13 / Helix / T-Series (Strict Discrete) */
> > > +static struct yogafan_config thinkpad_discrete_cfg =3D {
> > > +     .multiplier =3D 0, .fan_count =3D 1, .n_max =3D 7,
> > > +     .r_max =3D 5500, /* Matching table peak for T540p/TP13 */
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > > +     .paths =3D { "\\_SB.PCI0.LPC0.EC0.FAN0", "\\_SB.PCI0.LPC0.EC0.F=
ANS" }
> > > +};
> > > +
> > > +/* ThinkPad L-Series / V580 (Continuous 8-bit) */
> > > +static struct yogafan_config thinkpad_l_cfg =3D {
> > > +     .multiplier =3D 100, .fan_count =3D 1, .n_max =3D 100,
> > > +     .r_max =3D 5500, /* Matching table peak for L390 */
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > > +     .paths =3D { "\\_SB.PCI0.LPC0.EC0.FAN0", "\\_SB.PCI0.LPC0.EC0.F=
AN1" }
> > > +};
> > > +
> > > +/* High Performance (Strict Continuous) */
> > > +static struct yogafan_config legion_high_perf_cfg =3D {
> > > +     .multiplier =3D 1, .fan_count =3D 2, .n_max =3D 0,
> > > +     .r_max =3D 8000, /* Peak for Legion 7i / Yoga Pro 9 */
> > > +     .tau_ms =3D 1000, .slew_time_s =3D 4, .stop_threshold =3D 50,
> > >       .paths =3D { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.F=
A2S" }
> > >  };
> > >=20
> > > @@ -78,12 +165,21 @@ static void apply_rllag_filter(struct yoga_fan_d=
ata *data, int idx, long raw_rpm
> > >       long delta, step, limit, alpha;
> > >       s64 temp_num;
> > >=20
> > > -     if (raw_rpm < RPM_FLOOR_LIMIT) {
> > > +     /* 1. PHYSICAL CLAMP & TELEMETRY: Use per-device device_max_rpm=
 */
> > > +     if (raw_rpm > (long)data->device_max_rpm)
> > > +             raw_rpm =3D (long)data->device_max_rpm;
> > > +
> > > +     data->raw_val[idx] =3D raw_rpm;
> > > +
> > > +     /* 2. Threshold logic */
> > > +     if (raw_rpm < (long)(data->config->stop_threshold < MIN_THRESHO=
LD_RPM
> > > +             ? MIN_THRESHOLD_RPM : data->config->stop_threshold)) {
> > >               data->filtered_val[idx] =3D 0;
> > >               data->last_sample[idx] =3D now;
> > >               return;
> > >       }
> > >=20
> > > +     /* 3. Auto-reset logic */
> > >       if (data->last_sample[idx] =3D=3D 0 || dt_ms > MAX_SAMPLING) {
> > >               data->filtered_val[idx] =3D raw_rpm;
> > >               data->last_sample[idx] =3D now;
> > > @@ -99,14 +195,16 @@ static void apply_rllag_filter(struct yoga_fan_d=
ata *data, int idx, long raw_rpm
> > >               return;
> > >       }
> > >=20
> > > +     /* 4.  PHYSICS: Use per-device internal_tau_ms */
> > >       temp_num =3D dt_ms << 12;
> > > -     alpha =3D (long)div64_s64(temp_num, (s64)(TAU_MS + dt_ms));
> > > +     alpha =3D (long)div64_s64(temp_num, (s64)(data->config->tau_ms =
+ dt_ms));
> > >       step =3D (delta * alpha) >> 12;
> > >=20
> > >       if (step =3D=3D 0 && delta !=3D 0)
> > >               step =3D (delta > 0) ? 1 : -1;
> > >=20
> > > -     limit =3D (MAX_SLEW_RPM_S * (long)dt_ms) / 1000;
> > > +     /* 5.  SLEW: Use per-device internal_max_slew_rpm_s */
> > > +     limit =3D ((long)data->internal_max_slew_rpm_s * (long)dt_ms) /=
 1000;
> > >       if (limit < 1)
> > >               limit =3D 1;
> > >=20
> > > @@ -123,19 +221,38 @@ static int yoga_fan_read(struct device *dev, en=
um hwmon_sensor_types type,
> > >                        u32 attr, int channel, long *val)
> > >  {
> > >       struct yoga_fan_data *data =3D dev_get_drvdata(dev);
> > > +     const struct yogafan_config *cfg =3D data->config;
> > >       unsigned long long raw_acpi;
> > > +     long rpm_raw;
> > >       acpi_status status;
> > >=20
> > > -     if (type !=3D hwmon_fan || attr !=3D hwmon_fan_input)
> > > +     if (type !=3D hwmon_fan)
> > >               return -EOPNOTSUPP;
> > >=20
> > > +     /* 1. Handle static MAX attribute immediately without filtering=
 */
> > > +     if (attr =3D=3D hwmon_fan_max) {
> > > +             *val =3D (long)data->device_max_rpm;
> > > +             return 0;
> > > +     }
> > > +
> > > +     if (attr !=3D hwmon_fan_input)
> > > +             return -EOPNOTSUPP;
> > > +
> > > +     /* 2. Get hardware data only for INPUT requests */
> > >       status =3D acpi_evaluate_integer(data->active_handles[channel],=
 NULL, NULL, &raw_acpi);
> > >       if (ACPI_FAILURE(status))
> > >               return -EIO;
> > >=20
> > > -     apply_rllag_filter(data, channel, (long)raw_acpi * data->multip=
lier);
> > > -     *val =3D data->filtered_val[channel];
> > > +     /* 3. Calculate raw RPM based on architecture */
> > > +     if (cfg->n_max > 0)
> > > +             rpm_raw =3D (long)div64_s64((s64)cfg->r_max * raw_acpi,=
 cfg->n_max);
> > > +     else
> > > +             rpm_raw =3D (long)raw_acpi * cfg->multiplier;
> > > +
> > > +     /* 4. Apply filter only for real speed readings */
> > > +     apply_rllag_filter(data, channel, rpm_raw);
> > >=20
> > > +     *val =3D data->filtered_val[channel];
> > >       return 0;
> > >  }
> > >=20
> > > @@ -155,47 +272,150 @@ static const struct hwmon_ops yoga_fan_hwmon_o=
ps =3D {
> > >       .read =3D yoga_fan_read,
> > >  };
> > >=20
> > > -static const struct hwmon_channel_info *yoga_fan_info[] =3D {
> > > -     HWMON_CHANNEL_INFO(fan,
> > > -                        HWMON_F_INPUT, HWMON_F_INPUT,
> > > -                        HWMON_F_INPUT, HWMON_F_INPUT,
> > > -                        HWMON_F_INPUT, HWMON_F_INPUT,
> > > -                        HWMON_F_INPUT, HWMON_F_INPUT),
> > > -     NULL
> > > -};
> > > -
> > > -static const struct hwmon_chip_info yoga_fan_chip_info =3D {
> > > -     .ops =3D &yoga_fan_hwmon_ops,
> > > -     .info =3D yoga_fan_info,
> > > -};
> > > -
> > >  static const struct dmi_system_id yogafan_quirks[] =3D {
> > > +     /* --- DISCRETE OVERRIDES (Specific matches MUST come first) --=
- */
> > >       {
> > > -             .ident =3D "Lenovo Yoga",
> > > -             .matches =3D {
> > > -                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > -                     DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga"),
> > > -             },
> > > -             .driver_data =3D (void *)&yoga_8bit_fans_cfg,
> > > +             .ident =3D "Lenovo Yoga 710",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "Yoga 710") =
},
> > > +             .driver_data =3D &yoga_710_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo Yoga 510",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "Yoga 510") =
},
> > > +             .driver_data =3D &yoga_510_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo Ideapad 510s",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "Ideapad 510=
s") },
> > > +             .driver_data =3D &yoga_510_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo Ideapad 500S",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "Ideapad 500=
S") },
> > > +             .driver_data =3D &ideapad_500s_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo U31-70",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "U31-70") },
> > > +             .driver_data =3D &ideapad_500s_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo Yoga 3 14",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "80JH") },
> > > +             .driver_data =3D &yoga3_14_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo Yoga 2 13",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "20344") },
> > > +             .driver_data =3D &yoga2_13_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo Yoga 13",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "20191") },
> > > +             .driver_data =3D &yoga13_discrete_cfg,
> > >       },
> > > +     {
> > > +             .ident =3D "Lenovo U330p/U430p",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo u330=
p") },
> > > +             .driver_data =3D &legacy_u_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "ThinkPad 13",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "ThinkPad 13=
") },
> > > +             .driver_data =3D &thinkpad_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "ThinkPad Helix",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "3698") },
> > > +             .driver_data =3D &thinkpad_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "ThinkPad X-Series",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "ThinkPad X"=
) },
> > > +             .driver_data =3D &thinkpad_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "ThinkPad T-Series",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "ThinkPad T"=
) },
> > > +             .driver_data =3D &thinkpad_discrete_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo V330",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "81AX") },
> > > +             .driver_data =3D &thinkpad_l_cfg,
> > > +     },
> > > +
> > > +     /* --- SPECIAL PROFILES (Must precede general fallbacks) --- */
> > > +     {
> > > +             .ident =3D "Lenovo Yoga Pro",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "Yoga Pro") =
},
> > > +             .driver_data =3D &legion_high_perf_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo Legion Pro",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "Legion P") =
},
> > > +             .driver_data =3D &legion_high_perf_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo ThinkPad L",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "ThinkPad L"=
) },
> > > +             .driver_data =3D &thinkpad_l_cfg,
> > > +     },
> > > +
> > > +     /* --- CONTINUOUS FALLBACKS (Family matches last) --- */
> > >       {
> > >               .ident =3D "Lenovo Legion",
> > > -             .matches =3D {
> > > -                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > -                     DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion"),
> > > -             },
> > > -             .driver_data =3D (void *)&legion_16bit_dual_cfg,
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion") =
},
> > > +             .driver_data =3D &legion_continuous_16bit_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo LOQ",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_FAMILY, "LOQ") },
> > > +             .driver_data =3D &legion_continuous_16bit_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo Yoga",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga") },
> > > +             .driver_data =3D &yoga_continuous_8bit_cfg,
> > >       },
> > >       {
> > >               .ident =3D "Lenovo IdeaPad",
> > > -             .matches =3D {
> > > -                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > -                     DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad"),
> > > -             },
> > > -             .driver_data =3D (void *)&ideapad_8bit_fan0_cfg,
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad")=
 },
> > > +             .driver_data =3D &yoga_continuous_8bit_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo Xiaoxin",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_FAMILY, "Xiaoxin")=
 },
> > > +             .driver_data =3D &yoga_continuous_8bit_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo GeekPro",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_FAMILY, "GeekPro")=
 },
> > > +             .driver_data =3D &legion_continuous_16bit_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo ThinkBook",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkBook=
") },
> > > +             .driver_data =3D &yoga_continuous_8bit_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo Slim",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_FAMILY, "Slim") },
> > > +             .driver_data =3D &yoga_continuous_8bit_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo V-Series",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo V") =
},
> > > +             .driver_data =3D &yoga_continuous_8bit_cfg,
> > > +     },
> > > +     {
> > > +             .ident =3D "Lenovo Aura Edition",
> > > +             .matches =3D { DMI_MATCH(DMI_PRODUCT_NAME, "Aura") },
> > > +             .driver_data =3D &yoga_continuous_8bit_cfg,
> > >       },
> > >       { }
> > >  };
> > > +
> > >  MODULE_DEVICE_TABLE(dmi, yogafan_quirks);
> > >=20
> > >  static int yoga_fan_probe(struct platform_device *pdev)
> > > @@ -203,7 +423,10 @@ static int yoga_fan_probe(struct platform_device=
 *pdev)
> > >       const struct dmi_system_id *dmi_id;
> > >       const struct yogafan_config *cfg;
> > >       struct yoga_fan_data *data;
> > > -     struct device *hwmon_dev;
> > > +     struct hwmon_chip_info *chip_info;
> > > +     struct hwmon_channel_info *info;
> > > +     u32 *fan_config;
> > > +     acpi_status status;
> > >       int i;
> > >=20
> > >       dmi_id =3D dmi_first_match(yogafan_quirks);
> > > @@ -215,24 +438,62 @@ static int yoga_fan_probe(struct platform_devic=
e *pdev)
> > >       if (!data)
> > >               return -ENOMEM;
> > >=20
> > > -     data->multiplier =3D cfg->multiplier;
> > > +     data->config =3D cfg;
> > > +     data->device_max_rpm =3D cfg->r_max ?: 5000;
> > > +     data->internal_tau_ms =3D cfg->tau_ms;
> > > +     data->internal_max_slew_rpm_s =3D data->device_max_rpm / (cfg->=
slew_time_s ?: 1);
> > >=20
> > > -     for (i =3D 0; i < cfg->fan_count; i++) {
> > > -             acpi_status status;
> > > +     /* 1. Discover handles and set the REAL fan_count */
> > > +     for (i =3D 0; i < 2 && cfg->paths[i]; i++) {
> > > +             acpi_handle handle;
> > >=20
> > > -             status =3D acpi_get_handle(NULL, (char *)cfg->paths[i],
> > > -                                      &data->active_handles[data->fa=
n_count]);
> > > -             if (ACPI_SUCCESS(status))
> > > +             status =3D acpi_get_handle(NULL, cfg->paths[i], &handle=
);
> > > +             if (ACPI_SUCCESS(status)) {
> > > +                     data->active_handles[data->fan_count] =3D handl=
e;
> > >                       data->fan_count++;
> > > +             }
> > >       }
> > >=20
> > >       if (data->fan_count =3D=3D 0)
> > >               return -ENODEV;
> > >=20
> > > -     hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev, =
DRVNAME,
> > > -                                                      data, &yoga_fa=
n_chip_info, NULL);
> > > +     /* 2. Dynamically build the HWMON channel info (Fixes Guenter's=
 complaint) */
> > > +     fan_config =3D devm_kcalloc(&pdev->dev, data->fan_count + 1, si=
zeof(u32), GFP_KERNEL);
> > > +     if (!fan_config)
> > > +             return -ENOMEM;
> > > +
> > > +     for (i =3D 0; i < data->fan_count; i++)
> > > +             fan_config[i] =3D HWMON_F_INPUT | HWMON_F_MAX;
> > > +
> > > +     info =3D devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
> > > +     if (!info)
> > > +             return -ENOMEM;
> > > +
> > > +     info->type =3D hwmon_fan;
> > > +     info->config =3D fan_config;
> > > +
> > > +/* 3. Wrap it in chip_info */
> > > +     chip_info =3D devm_kzalloc(&pdev->dev, sizeof(*chip_info), GFP_=
KERNEL);
> > > +     if (!chip_info)
> > > +             return -ENOMEM;
> > > +
> > > +     chip_info->ops =3D &yoga_fan_hwmon_ops;
> > > +
> > > +     /* Create AND ALLOCATE the temporary pointer array */
> > > +     const struct hwmon_channel_info **chip_info_array;
> > > +
> > > +     chip_info_array =3D devm_kcalloc(&pdev->dev, 2, sizeof(*chip_in=
fo_array), GFP_KERNEL);
> > > +     if (!chip_info_array)
> > > +             return -ENOMEM;
> > > +
> > > +     chip_info_array[0] =3D info;
> > > +     chip_info_array[1] =3D NULL; /* Null terminated */
> > > +
> > > +     chip_info->info =3D chip_info_array;
> > >=20
> > > -     return PTR_ERR_OR_ZERO(hwmon_dev);
> > > +     /* 4. Register with the accurate hardware description and retur=
n the result */
> > > +     return PTR_ERR_OR_ZERO(devm_hwmon_device_register_with_info(&pd=
ev->dev,
> > > +                             DRVNAME, data, chip_info, NULL));
> > >  }
> > >=20
> > >  static struct platform_driver yoga_fan_driver =3D {
