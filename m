Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B701A3029;
	Sat, 10 Jan 2026 22:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768084260; cv=none; b=p1m4/qHDlLvIC7UsBMYnjTmwPjrzD7+2Oh0lkAltWFnXdqIE4aYA4xXeFM6wsNXTuxDBTq8OCYQI3/KQC+ry5BorvNMyb1uZBpiK6dAeF1JbSdpmgBMejpSptpp9ZQtbST1MgliLOgGK+FnAeZbmCjxZFfzUUZwCn8TB3SWNK78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768084260; c=relaxed/simple;
	bh=y0pixN3NQ3eyhCBiXBVZF5BqAOdCh5YDqRdmhDrjJfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ki09uFi2UN3CGHC9Gwz6Ep8z7QEpG88hjZDNUNkZQQvAFmYv/k78eHRb7fnkAxEkdT5bIPaUR/efoGBqtSfrCB0yX3Y5nwWKoPG1uT8dxZ+Y5JiYPsjCObDAwqM8Spjvf/k5is4224SGaGwzjzwbAEeaWmOaAT6fx9JD4WXDTLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QSFNA0KN; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QSFNA0KN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768084250; x=1768689050; i=w_armin@gmx.de;
	bh=1kxu7y54tIiSH6xSlG93WpYOXsvA7Kr5s/u2rxh7Jv8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QSFNA0KNtg6i+bWGt4V1tm6lG4qD+eOZRivHcLKmbwyTIQfqnhL3WzZM54rtOoHz
	 7R4oeBfhMJqs5baJeuoR6e1EoamY8Uvfpdvyxos5ifgcdUmQaGohK0MjmxWCY1N1k
	 qh2CPp/2uVcfrtyH/14/4JLAZPIafVcrcGQ4dgWfV2sbedK6XR8LSqK05Hqj4Am7N
	 Ur2nausCHInu7FVG4B9TmYMSA3IQOjdTpYIbOVgTzIT7YHCJXu4o/tv/aMqnPHPav
	 sEzz0+HDHWePFhWTDTVTOEp2AKhqz/eQK/GXCPKinF9DrkzEFZI9NGtlP4JQZUVrp
	 t9s3tg66dxkhRezYsg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1poA-1vguP33OW0-008ii3; Sat, 10
 Jan 2026 23:30:49 +0100
Message-ID: <5e7a2e9f-2c97-4803-95c2-8398793c91fd@gmx.de>
Date: Sat, 10 Jan 2026 23:30:47 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] platform/x86: lenovo-wmi-{capdata,other}: Add
 HWMON for fan speed
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-hwmon@vger.kernel.org
References: <20251125194959.157524-1-i@rong.moe>
 <4469595B-2116-4A97-98BB-8727C9F3D134@gmail.com>
 <bd88ef1f-2695-4cc2-fa78-f3e62d436edb@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <bd88ef1f-2695-4cc2-fa78-f3e62d436edb@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RUpaC1PmvPN0VRfWTjM/eF8s+0iMANQ2ZaTaQkUr4gueJLalBet
 glNqQ1EUSNJdojrqpnCPz9apwTFb0rf4YAyEk1wpLHYX7TKIV6FC25GbL9ydbtsuF9oIAZr
 C3RJyNdikZMWugcYWTEqrgWgCGO5Ta+9lQ5BrqDMI1xJa2HJkpCMK2i2QK7NHjyFgEGyZNK
 k2tJwVMAb6FKKngsf2QNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z4fOBd3Z6gQ=;SCZRy09nWppjGZllB2RAku08FTq
 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

Am 09.01.26 um 10:50 schrieb Ilpo J=C3=A4rvinen:

> On Fri, 9 Jan 2026, Derek J. Clark wrote:
>
>> On November 25, 2025 11:49:21 AM PST, Rong Zhang <i@rong.moe> wrote:
>>> Lenovo WMI Other Mode interface also supports querying or setting fan
>>> speed RPM. This capability is described by LENOVO_CAPABILITY_DATA_00.
>>> Besides, LENOVO_FAN_TEST_DATA provides reference data for self-test of
>>> cooling fans, including minimum and maximum fan speed RPM.
>>>
>>> This patchset turns lenovo-wmi-capdata01 into a unified driver (now
>>> named lenovo-wmi-capdata) for LENOVO_CAPABILITY_DATA_{00,01} and
>>> LENOVO_FAN_TEST_DATA; then adds HWMON support for lenovo-wmi-other:
>>>
>>> - fanX_enable: enable/disable the fan (tunable)
>>> - fanX_input: current RPM
>>> - fanX_max: maximum RPM
>>> - fanX_min: minimum RPM
>>> - fanX_target: target RPM (tunable)
>>>
>>> LENOVO_CAPABILITY_DATA_{00,01} presents on all devices, so
>>> both binds to lenovo-wmi-other. However, some device does not have
>>> LENOVO_FAN_TEST_DATA and its presence is described by
>>> LENOVO_CAPABILITY_DATA_00; hence, the former binds to the latter and a
>>> callback is used to pass the data to lenovo-wmi-other.
>>>
>>> Summarizing this scheme:
>>>
>>>         lenovo-wmi-other <-> capdata00 <-> capdata_fan
>>>         |- master            |- component
>>>                              |- sub-master
>>>                                            |- sub-component
>>>
>>> The callback will be called once both the master and the sub-component
>>> are bound to the sub-master (component).
>>>
>>> This scheme is essential to solve these issues:
>>> - The component framework only supports one aggregation per master
>>> - A binding is only established until all components are found
>>> - The Fan Test Data interface may be missing on some devices
>>> - To get rid of queries for the presence of WMI GUIDs
>>> - The notifier framework cannot cleanly connect capdata_fan to
>>>   lenovo-wmi-other without introducing assumptions on probing sequence
>>>
>>> capdata00 is registered as a component and a sub-master on probe,
>>> instead of chaining the registrations in one's bind callback. This is
>>> because calling (un)registration methods of the component framework
>>> causes deadlock in (un)bind callbacks, i.e., it's impossible to regist=
er
>>> capdata00 as a sub-master/component in its component/sub-master bind
>>> callback, and vice versa.
>>>
>>> The implementation does not rely on a specific binding sequence. This
>>> has been fuzz-tested using:
>>>
>>> 	#!/bin/bash
>>>
>>> 	DRV_DIR=3D/sys/bus/wmi/drivers/lenovo_wmi_cd
>>> 	CAPDATA_GUIDS=3D(
>>> 		$(find "$DRV_DIR"/ -name '*-*-*-*-*-*' -printf "%f ")
>>> 	)
>>>
>>> 	b() { sudo tee "$DRV_DIR"/bind <<<"$1"; }
>>> 	u() { sudo tee "$DRV_DIR"/unbind <<<"$1"; }
>>>
>>> 	for guid in "${CAPDATA_GUIDS[@]}"; do
>>> 		u "$guid"
>>> 	done
>>>
>>> 	while read -rsa perm; do
>>> 		for guid in "${perm[@]}"; do
>>> 			b "$guid"
>>> 		done
>>> 		sensors | grep -A3 lenovo_wmi_other || true
>>> 		for guid in "${perm[@]}"; do
>>> 			u "$guid"
>>> 		done
>>> 	done < <(python3 -c "
>>> 	from itertools import permutations
>>> 	ps =3D permutations('${CAPDATA_GUIDS[*]}'.split())
>>> 	for p in ps: print(' '.join(p))")
>>>
>>> 	for guid in "${CAPDATA_GUIDS[@]}"; do
>>> 		b "$guid"
>>> 	done
>>>
>>> Tested on ThinkBook 14 G7+ ASP.
>>>
>>> Changes in v7:
>>> - Fix missing #include (thanks Ilpo J=C3=A4rvinen)
>>> - Fix formatting issues (ditto)
>>> - dev_dbg() instead of dev_info() on probe success (ditto)
>>> - Rearrange to drop some gotos (ditto)
>>> - Move the declarations of __free()-managed variables to where they ar=
e
>>>   assigned (ditto)
>>> - Improve the readability of struct definition and error paths (ditto)
>>> - Prevent back-and-forth changes (ditto)
>>> - Fix mistakenly inverted boundary check
>>> - Emit unaligned access to Fan Test Data's WMI block
>>> - Properly calculate array index when we truncate Fan Test Data
>>> - Fix typo
>>> - Link to v6: https://lore.kernel.org/r/20251122184522.18677-1-i@rong.=
moe/
>>>
>>> Changes in v6:
>>> - Fix mistaken error paths
>>> - Link to v5: https://lore.kernel.org/r/20251114175927.52533-1-i@rong.=
moe/
>>>
>>> Changes in v5:
>>> - Do not cast pointer to non-pointer or vice versa (thanks kernel test
>>>   robot)
>>> - Fix missing include (ditto)
>>> - Link to v4: https://lore.kernel.org/r/20251113191152.96076-1-i@rong.=
moe/
>>>
>>> Changes in v4:
>>> - Get rid of wmi_has_guid() (thanks Armin Wolf's inspiration)
>>>   - Add [PATCH v4 6/7], please review & test
>>>     - Check 0x04050000.supported and bind capdata_fan to capdata00
>>>   - Rework HWMON registration
>>>     - Collect fan info from capdata00 and capdata_fan separately
>>>     - Use a callback to collect fan info from capdata_fan
>>>     - Trigger HWMON registration only if all fan info is collected
>>>     - Do not check 0x04050000.supported, implied by the presence of
>>>       capdata_fan
>>> - Drop Reviewed-by & Tested-by from [PATCH v4 7/7] due to the changes,
>>>   please review & test
>>> - Link to v3: https://lore.kernel.org/r/20251031155349.24693-1-i@rong.=
moe/
>>>
>>> Changes in v3:
>>> - Fix grammar (thanks Derek J. Clark)
>>> - Link to v2: https://lore.kernel.org/r/20251030193955.107148-1-i@rong=
.moe/
>>>
>>> Changes in v2:
>>> - Add a workaround for ACPI methods that return a 4B buffer for u32
>>>   (thanks Armin Wolf)
>>> - Fix function documentation (thanks kernel test bot)
>>> - Reword documentation (thanks Derek J. Clark)
>>> - Squash min/max reporting patch into the initial HWMON one (ditto)
>>> - Query 0x04050000 for interface availability (ditto)
>>>   - New parameter "expose_all_fans" to skip this check
>>> - Enforce min/max RPM constraint on set (ditto)
>>>   - New parameter "relax_fan_constraint" to disable this behavior
>>>   - Drop parameter "ignore_fan_cap", superseded by the next one
>>>   - New parameter "expose_all_fans" to expose fans w/o such data
>>> - Assume auto mode on probe (ditto)
>>> - Do not register HWMON device if no fan can be exposed
>>> - fanX_target: Return -EBUSY instead of raw target value when fan stop=
s
>>> - Link to v1: https://lore.kernel.org/r/20251019210450.88830-1-i@rong.=
moe/
>>>
>>> Rong Zhang (7):
>>>   platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
>>>   platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
>>>   platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capabilit=
y
>>>     Data
>>>   platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
>>>   platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
>>>   platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
>>>   platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning
>>>
>>> .../wmi/devices/lenovo-wmi-other.rst          |  43 +-
>>> drivers/platform/x86/lenovo/Kconfig           |   5 +-
>>> drivers/platform/x86/lenovo/Makefile          |   2 +-
>>> drivers/platform/x86/lenovo/wmi-capdata.c     | 812 ++++++++++++++++++
>>> drivers/platform/x86/lenovo/wmi-capdata.h     |  65 ++
>>> drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 -------
>>> drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
>>> drivers/platform/x86/lenovo/wmi-helpers.c     |  21 +-
>>> drivers/platform/x86/lenovo/wmi-other.c       | 515 ++++++++++-
>>> 9 files changed, 1433 insertions(+), 357 deletions(-)
>>> create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
>>> create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
>>> delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
>>> delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h
>>>
>>>
>>> base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
>> Ilpo,
>>
>> Is there any particular reason this appears to be stalled? I'd like to
>> start work on some features that rely on the capdata00 interface but I'=
m
>> waiting on this to be applied as there has been frequent back and forth
>> on exactly how to add the different components.
> Hi,
>
> I was thinking Armin might still take a look at it but perhaps his lates=
t
> message was effectively saying "the current approach is fine"?
>
> (And it has been holiday period too.)
>
That is indeed the case. As far as the WMI aspect is concerned, everything=
 is
fine.

Thanks,
Armin Wolf

