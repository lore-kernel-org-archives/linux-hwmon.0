Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353473191B5;
	Mon, 17 Nov 2025 06:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763361545; cv=none; b=pHJ45JOLS1OmIUr2GAsJMZdfIE7LXe641OzVc53ypyHTqIkfXvb+bE64XvJtTvdBd6uANALcHv/w+mbxbZilT3447mM5aqZAwfgUBgGmgZEjeVljQ3sx19KcCOXEEJB6HnxQCtYnIw+ovCi8CppqhdUNrJ7i510VEUCoJILku+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763361545; c=relaxed/simple;
	bh=1/MtG/XK4V9ZmQ7zgEM0xnwuWStjbMbaEV3GarsoiSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUHm43NuOdJIEVYwpgCSTTX2E+XhHbMhv6iIq3vN2nOlZJRjHGth/btXv7qrYNUKWP8W1Gd8FHlnCmKxmwmuQaJYLDIzTFIBcg/69l5qe+xRxocg4B7eTZ+hym3PMUOwJyJ/l5crmXAtRpwrmJx+L6xKnw2tWTkCVzwp5zK9Rzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KAcnFCAj; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KAcnFCAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763361531; x=1763966331; i=w_armin@gmx.de;
	bh=Tk2NHuP9CyDnNO2q6MHx9EQ3INkR+5bprmwUDttICqo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KAcnFCAjmVguUXJs+m6nLbpw97n/u6dPu8CHWMlyU8xM48HkeMW1EmFMNGuN03Yi
	 7GyvJncaop32WtzmkffQTF8O8IsXDWbMwS9uw5QPwmecqaPj4dI8wVkvJDVnenJMv
	 VEu9U3ZozNGEng+uQPrGLAhl6vJxOKw4GukXK8YJokXY1A/BEBRShv4Ae4odF5bny
	 wpiYz0onwpgY4zGZ4d63AKI0pAUw5ksn0L1gB60RvGd6fWomx66hMdsi0C+RJGtaG
	 6FKKYsOEdIPDNG8dRnKvcVqMqNFqCUuk/UEbLgfk/dFE0h8Yk22LnsZu0KpsgHga1
	 cMlpMzTSaizimmQoeA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JqV-1vLA0A0N6n-00CyH4; Mon, 17
 Nov 2025 07:38:51 +0100
Message-ID: <12f73d80-7e74-4e81-b7d1-2bcb0993bad0@gmx.de>
Date: Mon, 17 Nov 2025 07:38:49 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] platform/x86: lenovo-wmi-{capdata,other}: Add
 HWMON for fan speed
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20251114175927.52533-1-i@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251114175927.52533-1-i@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:g2OFHErBHtwLlxhamBp2PyfcWfx7DOnJSPsEZ6QLU95LNy/pA32
 0Z3r/LFPI4X9VqXKGvPmxCwIWsfSZG229ODTn4TUbJ1FVLZofkITmb3Knj/lQ0l00fcWVZu
 ehamyzreGoHJMLAn7hRAWP5waCB+YCEuJlaPiBotOoPfFvySC23EpUxacAV/Ju6vfc+7fSy
 Nmjfp90pngpWP15Qdr6Zg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2lHeN2DMNwU=;eG0PdNb55yXrsiDMfQ7eO58KmGE
 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

Am 14.11.25 um 18:59 schrieb Rong Zhang:

> Lenovo WMI Other Mode interface also supports querying or setting fan
> speed RPM. This capability is decribed by LENOVO_CAPABILITY_DATA_00.
> Besides, LENOVO_FAN_TEST_DATA provides reference data for self-test of
> cooling fans, including minimum and maximum fan speed RPM.
>
> This patchset turns lenovo-wmi-capdata01 into a unified driver (now
> named lenovo-wmi-capdata) for LENOVO_CAPABILITY_DATA_{00,01} and
> LENOVO_FAN_TEST_DATA; then adds HWMON support for lenovo-wmi-other:
>
>   - fanX_enable: enable/disable the fan (tunable)
>   - fanX_input: current RPM
>   - fanX_max: maximum RPM
>   - fanX_min: minimum RPM
>   - fanX_target: target RPM (tunable)
>
> LENOVO_CAPABILITY_DATA_{00,01} presents on all devices, so
> both binds to lenovo-wmi-other. However, some device does not have
> LENOVO_FAN_TEST_DATA and its presence is described by
> LENOVO_CAPABILITY_DATA_00; hence, the former binds to the latter and a
> callback is used to pass the data to lenovo-wmi-other.
>
> The implementation does not rely on a specific binding sequence. This
> has been fuzz-tested using:
>
> 	#!/bin/bash
>
> 	DRV_DIR=/sys/bus/wmi/drivers/lenovo_wmi_cd
> 	CAPDATA_GUIDS=(
> 		$(find "$DRV_DIR"/ -name '*-*-*-*-*-*' -printf "%f ")
> 	)
>
> 	b() { sudo tee "$DRV_DIR"/bind <<<"$1"; }
> 	u() { sudo tee "$DRV_DIR"/unbind <<<"$1"; }
>
> 	for guid in "${CAPDATA_GUIDS[@]}"; do
> 		u "$guid"
> 	done
>
> 	while read -rsa perm; do
> 		for guid in "${perm[@]}"; do
> 			b "$guid"
> 		done
> 		sensors | grep -A3 lenovo_wmi_other || true
> 		for guid in "${perm[@]}"; do
> 			u "$guid"
> 		done
> 	done < <(python3 -c "
> 	from itertools import permutations
> 	ps = permutations('${CAPDATA_GUIDS[*]}'.split())
> 	for p in ps: print(' '.join(p))")
>
> 	for guid in "${CAPDATA_GUIDS[@]}"; do
> 		b "$guid"
> 	done
>
> Tested on ThinkBook 14 G7+ ASP.

Sorry for taking a bit to respond to your question regarding the previous
patch series. Your idea with the submaster seems good to me. Your script
for testing this is a very cool idea, are you OK with me adding  a
similar script to the tools/wmi/?

Thanks,
Armin Wolf

> Changes in v5:
> - Do not cast pointer to non-pointer or vice versa (thanks kernel test
>    robot)
> - Fix missing include (ditto)
> - Link to v4: https://lore.kernel.org/r/20251113191152.96076-1-i@rong.moe/
>
> Changes in v4:
> - Get rid of wmi_has_guid() (thanks Armin Wolf's inspiration)
>    - Add [PATCH v4 6/7], please review & test
>    - Rework HWMON registration
>      - Collect fan into from capdata00 and capdata_fan separately
>      - Use a callback to collect fan info from capdata_fan
>      - Trigger HWMON registration only if all fan info is collected
>      - Do not check 0x04050000.supported, implied by the presense of
>        capdata_fan
> - Drop Reviewed-by & Tested-by from [PATCH v4 7/7] due to the changes,
>    please review & test
> - Link to v3: https://lore.kernel.org/r/20251031155349.24693-1-i@rong.moe/
>
> Changes in v3:
> - Fix grammar (thanks Derek J. Clark)
> - Link to v2: https://lore.kernel.org/r/20251030193955.107148-1-i@rong.moe/
>
> Changes in v2:
> - Add a workaround for ACPI methods that return a 4B buffer for u32
>    (thanks Armin Wolf)
> - Fix function documentation (thanks kernel test bot)
> - Reword documentation (thanks Derek J. Clark)
> - Squash min/max reporting patch into the initial HWMON one (ditto)
> - Query 0x04050000 for interface availability (ditto)
>    - New parameter "expose_all_fans" to skip this check
> - Enforce min/max RPM constraint on set (ditto)
>    - New parameter "relax_fan_constraint" to disable this behavior
>    - Drop parameter "ignore_fan_cap", superseded by the next one
>    - New parameter "expose_all_fans" to expose fans w/o such data
> - Assume auto mode on probe (ditto)
> - Do not register HWMON device if no fan can be exposed
> - fanX_target: Return -EBUSY instead of raw target value when fan stops
> - Link to v1: https://lore.kernel.org/r/20251019210450.88830-1-i@rong.moe/
>
> Rong Zhang (7):
>    platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
>    platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
>    platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability
>      Data
>    platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
>    platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
>    platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
>    platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning
>
>   .../wmi/devices/lenovo-wmi-other.rst          |  43 +-
>   drivers/platform/x86/lenovo/Kconfig           |   5 +-
>   drivers/platform/x86/lenovo/Makefile          |   2 +-
>   drivers/platform/x86/lenovo/wmi-capdata.c     | 808 ++++++++++++++++++
>   drivers/platform/x86/lenovo/wmi-capdata.h     |  65 ++
>   drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 -------
>   drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
>   drivers/platform/x86/lenovo/wmi-helpers.c     |  22 +-
>   drivers/platform/x86/lenovo/wmi-other.c       | 511 ++++++++++-
>   9 files changed, 1426 insertions(+), 357 deletions(-)
>   create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
>   create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
>   delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
>   delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h
>
>
> base-commit: 6da43bbeb6918164f7287269881a5f861ae09d7e
