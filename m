Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544629;
	b=mCBjAHTnNhdicDlWP1iiHa3YvA7T1lm6MmYQfV63lgFD9VcIg/fLbUzS9O5FL6h+hcTV
	 Bxm/e6WU2KtFmo2YvUp6qCkjNaSpt/q9vrKoeASLiCACfN5I/HNZwGY2od8YU4fnFW5W4
	 Eln8lI2nIGNiXf85nLtIMO0n7j3gt+WdbqSis0w92wj/FHpA1M1p9WEgw8oDr62c/4rsN
	 WXSkcd0h4xSa6sb8B/nALjjj1wmmLJLnzlFgdJfUmSZxW8WZgAD5IfiCrlKz0QVOtTY+6
	 uoADbH8Espc3QnzQGd5ZaWSwJEqUeJE6f1ngXl/0qHGuA93thJnyw+w2GjoWjTvtq7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544629;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:X-Source:
	 X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=BrRYfeVr+z01zry/aQJMfNGwL/0oFnSPU07sQNMOshI=;
	b=vR5NRHfysXU1/mFhBTGRDwlbzBE009UZiQ06VIluSbAJWFJaQgFfJqFC1coPiphsphQo
	 ejqfhPFSRS93stFyxqDZeExmn8FC3ZOD/Vmxu86Lqk4myva1ue0vEeP9kR34RTUtIDYln
	 pUZksNQ8kEghO6YOUGVBebhcov42zQSz/B2pbvasl6T+/6GAw5hB2TbU//OJd17/FLhlQ
	 /38xwQXBLfBg0TNQeqqw3G7fslFp9YE+LF57q/hGpVE39Ep8NWcgg8HzB3Y78ZZi2D3cN
	 128sEvtnkYOjWaj7tfrSWv4t/2iMltimG6D1oSuioNsbrDh4EHNKpM67fs3mUgNwHuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=H7JrOqU5;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982BE606A321
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 04:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=H7JrOqU5
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id RcrOx8NrE4vCDRj2BxogyB; Fri, 13 Nov 2026 04:37:07 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Rj2AxaNBulaNKRj2AxvXfW; Fri, 13 Nov 2026 04:37:07 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6af693f3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=5KLPUuaC_9wA:10 a=M0FbrtG7MMAA:10
 a=NEAV23lmAAAA:8 a=UrhUQFNGRb0gRibL9mEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=BrRYfeVr+z01zry/aQJMfNGwL/0oFnSPU07sQNMOshI=; b=H7JrOqU5dC2s
	SY+mIa/KZZe4lUnTotEulSKxfoEXwOgHCHB7aJ1S3VEu2kzSdlXXl1x27HM2gBcNL9C2Na8vyZfqq
	J8Iu5aIF5XA+3lMPZMdU7WGDH0kaU+CoNRbMPn0P+0D4uOaEP3k0PKQx0dTpX9nR2CueredST1N0T
	bfChvZDsnydCdX/vsDlg4GPFxIFADgm80q0BFywXttpYs9PSmunTO0USfVMmbLwQSOI91mrqBM0oK
	F7SdEfGlIjdchgJlv3Mv7qLTZLGjJbDgNRpOaSWwycGDArXULjp6ep0l1D5MIaERYBpMSqRVVCTLw
	2YrPqzYJJcWbEWOYJM5j5A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40126 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xRj2A-00000000fA4-1W5A;
	Fri, 13 Nov 2026 10:07:06 +0530
Date: Thu, 12 Nov 2026 20:37:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Oscar P <niviuq@gmail.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: Razer PWM PC Fan =?utf-8?Q?Controller_?=
 =?utf-8?B?KDE1MzI6MGYzYykg?= =?utf-8?B?4oCT?= guidance on potential upstream
 hwmon support
Message-ID: <3c03c028-c804-4056-8c32-c4c1279a3003@roeck-us.net>
References: <CAHd3fE_b65W3ypNR4xpb4SPK6R0KPTWC_p0xyUHhk1kX9urJjg@mail.gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHd3fE_b65W3ypNR4xpb4SPK6R0KPTWC_p0xyUHhk1kX9urJjg@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xRj2A-00000000fA4-1W5A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40126
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAMFBSNLT7KrcunwG4RIqw5vAjMmiXfWWZHcu8kr4OlCtF+Wq7NUwVwi7D1D/IKHk6Xed1+n9DXhGf8QUbei0tjqp2jly5ermrjMOtdReAOXO11Rvmov
 ZhoRiy5neiDPLQGj/FXkiuPwmRw7b6Zx/etuHmZyNBixnWpbthosB/ECyIUZ1FcSjvflnRfWzaYFhKXnHyQiCULLbzm04j51yK44hK5WuoAo0pWHAgjKP5cM

On Thu, Nov 12, 2026 at 07:55:01PM -0500, Oscar P wrote:
> Hello Guenter and hwmon maintainers,
> 
> I hope you don’t mind me reaching out with a question regarding an existing
> community driver.
> 
> I’m a Linux user interested in getting proper support for the Razer PWM PC
> Fan Controller (USB HID, VID 1532 0f3c), an eight-channel fan controller
> that currently lacks an upstream Linux driver.
> 
> Some promising community work already exists:
> 
>    - Original experimental driver:
>    https://github.com/SlimRG/razer-pwm-pc-fan-hwmon
>    - Pull request addressing USB communication and stability issues:
>    https://github.com/SlimRG/razer-pwm-pc-fan-hwmon/pull/3
>    - More recent fork with Bazzite/Fedora integration:
>    https://github.com/ANeuen/razer-pwm-pc-fan-hwmon
> 
> The author of the last fork reports successful operation with CoolerControl
> on Bazzite, including tests involving USB disconnection and reconnection:
> 
> https://github.com/openrazer/openrazer/issues/1809#issuecomment-6838865434
> 
> The driver exposes fan RPM readings and PWM controls through the standard
> Linux hwmon interface. However, earlier versions experienced communication
> and stability problems, and the current implementation still requires
> external kernel module compilation.
> 
> I am not the author of the driver, and I cannot claim that the existing
> code is ready for upstream inclusion. My intention is simply to help bring
> these efforts to the attention of people with the appropriate kernel
> development experience.
> 
> Would a USB HID driver exposing standard hwmon attributes be a suitable
> approach for upstream support of this device?
> 
> If so, could you suggest the most appropriate next steps for the existing
> contributors, particularly regarding stability testing, error recovery, PWM
> safety and preparation for an eventual upstream submission?
> 
> Any technical guidance or pointers to interested developers would be
> greatly appreciated.
> 
> Thank you very much for your time and for your continued work on Linux
> hardware monitoring.
> 

The main problem is that the driver is licensed under is GPL 3, which
is incompatible with GPL2 as used in the Linux kernel. My understanding
is that each and every contributor to the code would have to agree to
re-license the code under a dual GPL 2/3 license or under some other
permissive license such as MIT or BSD. Google search actually advises
that GPL 3 licensed out-of-tree kernel modules can not even be legally
distributed. However, I am not an attorney, so I would strongly suggest
legal advice.

Technically the driver has a few problems, but overall it is in decent
shape. It has a few quirks - I don't accept forward declarations, the
private debug code (on top of dev_dbg) is a non-go, and a few others.
I attached a Sashiko review below in case anyone is interested carrying
this further.

Hope this helps,
Guenter

---
Findings:
  Critical: 0  High: 4  Medium: 5  Low: 1

  --- Patch [1] hwmon: Add support for Razer PWM controller ---
  [High] hwmon: razer: use-after-stop in razer_pwm_remove() due to devm hwmon ordering
  [High] hwmon: razer: unchecked to_usb_interface() cast in razer_pwm_probe()
  [High] hwmon: razer: uninitialized stack memory read in razer_write_and_read() callers
  [Medium] hwmon: razer: per-function static seq variables cause collisions and data races
  [Medium] hwmon: razer: rpm_cache_jiffies init to 0 returns 0 RPM during early boot
  [High] hwmon: razer: broken pwmN_enable ABI and state tracking in razer_hwmon_write()
  [Medium] hwmon: razer: excessive msleep() delays under d->lock in razer_force_workfn()
  [Medium] hwmon: razer: undocumented module parameters and unsafe force_write_ms handling
  [Low] hwmon: razer: missing documentation, LLM artifacts, and hwmon style violations
  [Medium] hwmon: razer: fix built-in driver registration failure via late_initcall()


Inline Review:

hwmon: Add support for Razer PWM controller

This commit adds a new hwmon driver (drivers/hwmon/razer.c) for the Razer
PWM PC Fan Controller USB HID device (1532:0F3C), exposing 8 channels of
fan speed reading and PWM control via sysfs.

> diff --git a/drivers/hwmon/razer.c b/drivers/hwmon/razer.c
> new file mode 100644
> index 0000000000000..c5841754f9544
> --- /dev/null
> +++ b/drivers/hwmon/razer.c
> @@ -0,0 +1,700 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Razer PWM PC Fan Controller (USB HID, 1532:0F3C)
> +// Exposes RPM + PWM via hwmon sysfs (fanN_input, pwmN, pwmN_enable).
> +//
> +// Protocol is based on widely used userland implementations:
> +// - LibreHardwareMonitor's RazerFanController.cs :contentReference[oaicite:5]{index=5}
> +// - FanControl.Razer PwmFanControllerDevice.cs :contentReference[oaicite:6]{index=6}

[ ... ]

> +// Notes:
> +// - Some reads respond BUSY; we poll until SUCCESS or timeout.
> +// - We implement manual mode only for pwmN_enable=1.
> +// - pwmN_enable=0 sets a safe default 50% (documented in repo README). :contentReference[oaicite:7]{index=7}
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/hid.h>
> +#include <linux/usb.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/delay.h>
> +#include <linux/jiffies.h>
> +#include <linux/workqueue.h>
> +#include <linux/moduleparam.h>
> +#include <linux/printk.h>

[ ... ]

> +struct razer_pwm_dev; // forward declaration for debug helpers
> +
> +static bool debug = false;
> +module_param(debug, bool, 0644);
> +MODULE_PARM_DESC(debug, "Enable verbose debug logging (incl. HID packet hex dumps)");
> +
> +static int force_write_ms = 2500;
> +module_param(force_write_ms, int, 0644);
> +MODULE_PARM_DESC(force_write_ms, "Force re-apply cached PWM values every N ms (0=disable)");

[Severity: Medium]
Should the new module parameters razer.debug and razer.force_write_ms be
documented in Documentation/admin-guide/kernel-parameters.txt?

Also, because force_write_ms is writable at runtime via sysfs with 0644
permissions, what happens if userspace modifies
/sys/module/razer/parameters/force_write_ms while razer_force_workfn() is
sleeping on d->lock or waiting for HID transfers?

In drivers/hwmon/razer.c:razer_force_workfn():
	if (force_write_ms <= 0)
		return;
	...
	schedule_delayed_work(&d->force_work, msecs_to_jiffies(force_write_ms));

Since force_write_ms is re-read at the end of razer_force_workfn() without
re-checking that it is positive, setting it to 0 while the worker is running
queues an immediate 0-delay work item, and setting it to a negative value
passes a negative integer to msecs_to_jiffies(), which converts it to a huge
unsigned delay. Conversely, if force_write_ms is 0 during razer_pwm_probe() or
set to 0 at runtime, writing a positive value later will never start
force_work.

> +
> +#define razer_dev(d) (&(d)->hdev->dev)
> +
> +#define razer_dbg(d, fmt, ...)                                \
> +	do {                                                      \
> +		if (debug)                                            \
> +			dev_info(razer_dev(d), "dbg: " fmt, ##__VA_ARGS__);\
> +		else                                                  \
> +			dev_dbg(razer_dev(d), fmt, ##__VA_ARGS__);         \
> +	} while (0)
> +
> +// Hex dump only when debug=1 (so production logs stay clean)
> +static void razer_hex_dump(struct razer_pwm_dev *d, const char *prefix, const u8 *buf, size_t len)
> +{
> +	if (!debug)
> +		return;
> +
> +	print_hex_dump(KERN_INFO, prefix, DUMP_PREFIX_OFFSET, 16, 1, buf, len, false);
> +}
> +
> +struct razer_pwm_dev {
> +	struct hid_device *hdev;
> +	struct device *hwmon_dev;
> +	struct mutex lock;

[Severity: Low]
This isn't a runtime bug, but several items in this patch do not follow
Documentation/hwmon/submitting-patches.rst and kernel coding style:

1. Documentation/hwmon/razer.rst is missing, and the commit message body is
   empty.
   [groeck: Yes, I was too lazy to bother with this. A complete patch
    submission would need to provide it.]

2. The header comments in drivers/hwmon/razer.c contain leftover chatbot
   citation tags (:contentReference[oaicite:...]) and reference an external
   repo readme.

3. Could the driver use hwmon_lock() and hwmon_unlock() on d->hwmon_dev
   where applicable instead of a driver-private mutex, use standard C /* ... */
   comments instead of // comments, drop the unused <linux/hwmon-sysfs.h>
   include (and sort the remaining headers alphabetically), remove the unused
   parameter d from razer_hex_dump() along with the struct razer_pwm_dev
   forward declaration, avoid computing razer_checksum(buf) in
   razer_build_packet() before callers fill the payload and recompute it, and
   fix the space-indented blocks in razer_get_channel_speed() and
   razer_pwm_probe()?

[ ... ]

> +static int razer_write_and_read(struct razer_pwm_dev *d, const u8 *tx, u8 *rx)
> +{
> +	int ret;
> +	unsigned long timeout;
> +
> +	razer_dbg(d, "SET_REPORT seq=0x%02x class=0x%02x cmd=0x%02x len=%u\n",
> +		  tx[2], tx[7], tx[8], tx[6]);
> +	razer_hex_dump(d, "razer tx: ", tx, PKT_LEN);
> +
> +	ret = razer_feature_set(d->hdev, tx[0], (u8 *)tx, PKT_LEN);
> +	razer_dbg(d, "SET_REPORT returned ret=%d\n", ret);
> +	if (ret < 0)
> +		return ret;
> +
> +	msleep(DEVICE_READ_DELAY_MS);
> +
> +	timeout = jiffies + msecs_to_jiffies(DEVICE_READ_TIMEOUT_MS);
> +
> +	do {
> +		ret = razer_feature_get(d->hdev, tx[0], rx, PKT_LEN);
> +		if (ret < 0) {
> +			razer_dbg(d, "GET_REPORT failed: ret=%d cmd=0x%02x channel=0x%02x\n",
> +					  ret, tx[8], tx[10]);
> +			return ret;
> +		}
> +		razer_hex_dump(d, "razer rx: ", rx, (size_t)ret);
> +
> +		// Some HID stacks could theoretically return a shorter read.
> +		if (ret < PKT_LEN) {
> +			msleep(DEVICE_READ_DELAY_MS);
> +			continue;
> +		}
> +
> +		// Validate checksum (best-effort)
> +		if (rx[89] != razer_checksum(rx)) {
> +			razer_dbg(d, "checksum mismatch (rx=0x%02x calc=0x%02x)\n",
> +				  rx[89], razer_checksum(rx));
> +			// still continue; some stacks may mangle trailing bytes
> +		}
> +
> +		// If BUSY, keep polling
> +		if (rx[1] == ST_BUSY) {
> +			msleep(DEVICE_READ_DELAY_MS);
> +			continue;
> +		}
> +
> +		// If we got a stale packet (seq mismatch), drain a bit:
> +		if (rx[2] != tx[2]) {
> +			int i;
> +			for (i = 0; i < 5; i++) {
> +				msleep(DEVICE_READ_DELAY_MS);
> +				ret = razer_feature_get(d->hdev, tx[0], rx, PKT_LEN);
> +				if (ret < 0)
> +					return ret;
> +
> +				if (ret >= 9 && rx[1] == ST_SUCCESS && rx[2] == tx[2])
> +					return 0;
> +			}
> +
> +			hid_err(d->hdev, "sequence mismatch: expected 0x%02x got 0x%02x\n",
> +				tx[2], rx[2]);
> +			return -EIO;\n> +		}
> +
> +		break;
> +
> +	} while (time_before(jiffies, timeout));
> +
> +	if (rx[1] == ST_BUSY) {
> +		hid_err(d->hdev, "device BUSY timeout (seq=0x%02x)\n", tx[2]);
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (rx[1] != ST_SUCCESS) {
> +		hid_err(d->hdev, "device status error 0x%02x (seq=0x%02x)\n", rx[1], tx[2]);
> +		return -EIO;
> +
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Can razer_write_and_read() return 0 while leaving payload bytes in the caller's
on-stack rx[PKT_LEN] buffer uninitialized?

All four callers (razer_set_channel_mode_manual(),
razer_set_channel_percent(), razer_get_channel_speed(), and
razer_get_firmware()) pass an uninitialized stack array u8 rx[PKT_LEN] into
razer_write_and_read(), and razer_feature_get() only copies ret bytes into rx.

There appear to be two paths where razer_write_and_read() succeeds without
filling the payload:

1. In the sequence-mismatch drain loop (when rx[2] != tx[2]), the check:

	if (ret >= 9 && rx[1] == ST_SUCCESS && rx[2] == tx[2])
		return 0;

   accepts a short report of 9..14 bytes, leaving rx[9..11] in
   razer_get_firmware() and rx[13..14] in razer_get_channel_speed()
   uninitialized when read and exposed via fanN_input. Also, if the device
   responds with rx[2] == tx[2] and rx[1] == ST_BUSY during those 5 drain
   attempts, the loop finishes and logs a misleading sequence mismatch error
   where tx[2] and rx[2] are identical.

2. If razer_feature_get() repeatedly returns a short read (ret < PKT_LEN) until
   timeout expires, the do-while loop terminates via continue and falls
   through to inspect rx[1]. If ret was <= 1, rx[1] itself is uninitialized
   stack memory; if ret was between 2 and 14 and rx[1] happened to be
   ST_SUCCESS, razer_write_and_read() returns 0 without checking ret == PKT_LEN
   or rx[2] == tx[2].

> +
> +// ===== Device ops =====
> +
> +static int razer_set_channel_mode_manual(struct razer_pwm_dev *d, int channel)
> +{
> +	u8 tx[PKT_LEN], rx[PKT_LEN];
> +	static u8 seq;
> +
> +	razer_build_packet(tx, razer_next_seq(&seq), 3, CC_PWM, CMD_SET_CHANNEL_MODE);
> +	tx[9]  = 0x01;
> +	tx[10] = (u8)(0x05 + channel);
> +	tx[11] = MODE_MANUAL;
> +	tx[89] = razer_checksum(tx);
> +
> +	return razer_write_and_read(d, tx, rx);
> +}
> +
> +static int razer_set_channel_percent(struct razer_pwm_dev *d, int channel, u8 percent)
> +{
> +	u8 tx[PKT_LEN], rx[PKT_LEN];
> +	static u8 seq;
> +
> +	if (percent > 100)
> +		percent = 100;
> +
> +	razer_build_packet(tx, razer_next_seq(&seq), 3, CC_PWM, CMD_SET_CHANNEL_PERCENT);
> +	tx[9]  = 0x01;
> +	tx[10] = (u8)(0x05 + channel);
> +	tx[11] = percent;
> +	tx[89] = razer_checksum(tx);
> +
> +	return razer_write_and_read(d, tx, rx);
> +}
> +
> +static int razer_get_channel_speed(struct razer_pwm_dev *d, int channel, int *rpm_out)
> +{
> +	u8 tx[PKT_LEN], rx[PKT_LEN];
> +	static u8 seq;
> +	int ret;
> +	int rpm;
> +
> +	razer_build_packet(tx, razer_next_seq(&seq), 6, CC_PWM, CMD_GET_CHANNEL_SPEED);
> +	tx[9]  = 0x01;
> +	tx[10] = (u8)(0x05 + channel);
> +	tx[89] = razer_checksum(tx);
> +
> +	ret = razer_write_and_read(d, tx, rx);
> +	if (ret < 0)
> +		return ret;
> +
> +	// Response stores RPM as big-endian int16 at Data[4..5] => rx[9+4], rx[9+5]
> +
> +        rpm = ((int)rx[13] << 8) | (int)rx[14];
> +	*rpm_out = rpm;
> +	return 0;
> +}
> +
> +static int razer_get_firmware(struct razer_pwm_dev *d, u8 *v1, u8 *v2, u8 *v3)
> +{
> +	u8 tx[PKT_LEN], rx[PKT_LEN];
> +	static u8 seq;

[Severity: Medium]
Should the packet sequence number be stored in struct razer_pwm_dev instead of
separate function-local static u8 seq variables in
razer_set_channel_mode_manual(), razer_set_channel_percent(),
razer_get_channel_speed(), and razer_get_firmware()?

Because razer_set_channel_mode_manual() and razer_set_channel_percent() are
always called back-to-back (in razer_pwm_probe(), razer_hwmon_write(), and
razer_force_workfn()), their independent static counters advance in lockstep
and send the exact same sequence number on consecutive commands, defeating the
rx[2] != tx[2] stale-response check in razer_write_and_read().

In addition, because static variables are shared across all device instances
while d->lock is per-device (and razer_get_firmware() in razer_pwm_probe() is
called without holding d->lock), concurrent accesses on multiple controllers
will race in razer_next_seq(&seq).

[ ... ]

> +static int razer_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	struct razer_pwm_dev *d = dev_get_drvdata(dev);
> +	int rpm, ret;
> +
> +	mutex_lock(&d->lock);
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		if (attr != hwmon_fan_input || channel < 0 || channel >= CHANNEL_COUNT) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		// Simple cache: read at most every ~200ms
> +		if (time_before(jiffies, d->rpm_cache_jiffies[channel] + msecs_to_jiffies(200))) {
> +			*val = d->rpm_cache[channel];
> +			ret = 0;
> +			break;
> +		}

[Severity: Medium]
Won't initializing d->rpm_cache_jiffies[i] = 0 in razer_pwm_probe() cause
razer_hwmon_read() to return a cached 0 for fanN_input without querying the
hardware during the first 5 minutes after boot on 32-bit systems?

Since jiffies starts at INITIAL_JIFFIES (-300 * HZ),
time_before(jiffies, 0 + msecs_to_jiffies(200)) evaluates to true until jiffies
wraps past 0, so razer_hwmon_read() will return d->rpm_cache[channel] (0)
instead of calling razer_get_channel_speed(). Initializing
d->rpm_cache_jiffies[i] to jiffies - msecs_to_jiffies(200) (or tracking cache
validity) would avoid returning stale zeros.

[ ... ]

> +static int razer_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long val)
> +{
> +	struct razer_pwm_dev *d = dev_get_drvdata(dev);
> +	int ret = 0;
> +	u8 percent;
> +
> +	mutex_lock(&d->lock);
> +
> +	switch (type) {
> +	case hwmon_pwm:
> +		if (channel < 0 || channel >= CHANNEL_COUNT) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		if (attr == hwmon_pwm_enable) {
> +			// Convention: 1=manual, 2=auto (not supported), 0=disable.
> +			// We implement:
> +			//  - 1: manual mode enabled
> +			//  - 0: set safe default 50% and mark disabled
> +			if (val == 1) {
> +				d->pwm_enable[channel] = 1;
> +				ret = razer_set_channel_mode_manual(d, channel);
> +				if (ret < 0)
> +					break;
> +
> +				ret = razer_set_channel_percent(d, channel, d->pwm_percent[channel]);
> +			} else if (val == 0) {
> +				d->pwm_enable[channel] = 0;
> +				d->pwm_percent[channel] = DEFAULT_SPEED_PERCENT;
> +				ret = razer_set_channel_mode_manual(d, channel);
> +				if (ret < 0)
> +					break;
> +				ret = razer_set_channel_percent(d, channel, DEFAULT_SPEED_PERCENT);
> +			} else {
> +				ret = -EINVAL;
> +			}
> +		} else if (attr == hwmon_pwm_input) {
> +			// hwmon writes 0..255
> +			if (val < 0) val = 0;
> +			if (val > 255) val = 255;
> +
> +			percent = (u8)((val * 100 + 127) / 255);
> +			d->pwm_percent[channel] = percent;
> +
> +			// Apply only if manual enabled, otherwise just cache
> +			if (d->pwm_enable[channel] == 1) {
> +				ret = razer_set_channel_mode_manual(d, channel);
> +				if (ret < 0)
> +					break;
> +				ret = razer_set_channel_percent(d, channel, percent);
> +			}
> +		} else {
> +			ret = -EINVAL;
> +		}
> +		break;
> +
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +
> +	mutex_unlock(&d->lock);
> +	return ret;
> +}

[Severity: High]
Does the pwmN_enable handling here and in razer_pwm_probe() match the hwmon
sysfs ABI and keep cached state consistent with the hardware?

1. Per Documentation/ABI/testing/sysfs-class-hwmon, pwmN_enable=0 means
   disabling PWM fan speed control (i.e. running fans at full speed, 100%),
   which tools like fancontrol expect when shutting down. Here, writing 0
   forces the controller into manual mode at 50% (DEFAULT_SPEED_PERCENT).

2. In razer_pwm_probe(), the driver forces all 8 channels into manual mode
   (MODE_MANUAL) at 50% speed on the hardware, but initializes
   d->pwm_enable[i] = 0. Because d->pwm_enable[i] is 0, subsequent writes to
   pwmN only update d->pwm_percent[channel] without sending the new speed to
   the controller, and reading pwmN back reports the unapplied value instead
   of the 50% speed actually running on the hardware.

3. In razer_hwmon_write(), d->pwm_enable[channel] and d->pwm_percent[channel]
   are updated before razer_set_channel_mode_manual() and
   razer_set_channel_percent() succeed. If either transfer fails, the function
   returns an error, but the new state remains cached and will be reported by
   razer_hwmon_read() and applied later by razer_force_workfn().

[ ... ]

> +static void razer_force_workfn(struct work_struct *work)
> +{
> +	struct razer_pwm_dev *d = container_of(to_delayed_work(work), struct razer_pwm_dev, force_work);
> +	int i;
> +
> +	if (force_write_ms <= 0)
> +		return;
> +
> +	mutex_lock(&d->lock);
> +
> +	for (i = 0; i < CHANNEL_COUNT; i++) {
> +		// Only re-apply in manual mode (1)
> +		if (d->pwm_enable[i] == 1) {
> +			(void)razer_set_channel_mode_manual(d, i);
> +			(void)razer_set_channel_percent(d, i, d->pwm_percent[i]);
> +		}
> +	}
> +
> +	mutex_unlock(&d->lock);
> +
> +	schedule_delayed_work(&d->force_work, msecs_to_jiffies(force_write_ms));
> +}

[Severity: Medium]
Doesn't holding d->lock across all 8 channels in razer_force_workfn() block
sysfs readers and writers for almost the entire 2500 ms interval?

Each command calls razer_feature_set(), which sleeps for 100 ms before
hid_hw_raw_request(), followed by another 50 ms sleep in
razer_write_and_read() before polling GET_REPORT. When all 8 channels have
manual mode enabled, razer_force_workfn() issues 16 commands under d->lock,
sleeping for at least 2.4 seconds (and over 10 seconds if transfers time out)
every 2.5 seconds on system_percpu_wq. Similarly, razer_pwm_probe() issues 17
commands synchronously, blocking probe for at least 2.55 seconds while
ignoring any errors from the 16 channel setup commands.

> +
> +// ===== HID driver glue =====
> +
> +static int razer_pwm_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +    struct razer_pwm_dev *d;
> +    struct usb_interface *intf;
> +    int ret, i;
> +    u8 fw1 = 0, fw2 = 0, fw3 = 0;
> +
> +    intf = to_usb_interface(hdev->dev.parent);
> +	if (intf->cur_altsetting->desc.bInterfaceNumber != 0) {
> +		return -ENODEV;
> +	}

[Severity: High]
What happens in razer_pwm_probe() if a non-USB HID device (for example, a
virtual device created via uhid with BUS_USB and matching vendor/product IDs)
is bound to this driver?

Calling to_usb_interface(hdev->dev.parent) and dereferencing
intf->cur_altsetting without first checking hid_is_usb(hdev) will perform an
invalid container_of() cast on hdev->dev.parent and dereference an invalid
pointer.

[ ... ]

> +	// Register hwmon device
> +	d->hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev,
> +							    "razer_pwm_pc_fan",
> +							    d,
> +							    &razer_chip_info,
> +							    NULL);
> +	if (IS_ERR(d->hwmon_dev)) {
> +		ret = PTR_ERR(d->hwmon_dev);
> +		hid_err(hdev, "hwmon registration failed: %d\n", ret);
> +		goto close;
> +	}
> +
> +	if (force_write_ms > 0)
> +		schedule_delayed_work(&d->force_work, msecs_to_jiffies(force_write_ms));
> +
> +	hid_info(hdev, "Razer PWM PC Fan Controller hwmon loaded\n");
> +	return 0;
> +
> +close:
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +	return ret;
> +}
> +
> +static void razer_pwm_remove(struct hid_device *hdev)
> +{
> +	struct razer_pwm_dev *d = hid_get_drvdata(hdev);
> +
> +	if (d)
> +		cancel_delayed_work_sync(&d->force_work);
> +
> +	hid_info(hdev, "Razer PWM PC Fan Controller hwmon removed\n");
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}

[Severity: High]
Because d->hwmon_dev is registered with devm_hwmon_device_register_with_info()
on &hdev->dev, won't the hwmon sysfs attributes remain exposed until devres
cleanup runs after razer_pwm_remove() returns?

When the device is removed or unbound, razer_pwm_remove() calls
hid_hw_close(hdev) and hid_hw_stop(hdev) while fanN_input, pwmN, and
pwmN_enable are still active, so a concurrent sysfs read or write in
razer_hwmon_read() or razer_hwmon_write() can call hid_hw_raw_request() on a
closed and stopped hid_device. Unregistering the hwmon device before
hid_hw_close() and hid_hw_stop() (or registering a devm_add_action_or_reset()
cleanup hook before devm_hwmon_device_register_with_info()) would prevent
this race.

> +
> +static const struct hid_device_id razer_pwm_table[] = {
> +	{ HID_USB_DEVICE(0x1532, 0x0F3C) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(hid, razer_pwm_table);
> +
> +static struct hid_driver razer_pwm_driver = {
> +	.name = DRIVER_NAME,
> +	.id_table = razer_pwm_table,
> +	.probe = razer_pwm_probe,
> +	.remove = razer_pwm_remove,
> +};
> +
> +module_hid_driver(razer_pwm_driver);

[Severity: Medium]
Will driver registration succeed when CONFIG_SENSORS_RAZER is built-in (=y)?

In drivers/Makefile, hwmon/ is linked before hid/. Because hid_init() in
drivers/hid/hid-core.c uses module_init() (device_initcall), using
module_hid_driver() in drivers/hwmon/razer.c runs hid_register_driver() at
device_initcall time before hid_init() has registered hid_bus_type, causing
driver_register() to fail with -EINVAL. Other HID drivers in drivers/hwmon/
(such as corsair-cpro.c and nzxt-smart2.c) use late_initcall() when built-in
to avoid this ordering issue.

Tokens: 2979872 in / 128302 out / 2225180 cached
