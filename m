Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659974;
	b=0aBWdchCfyAXFRsnOw5o79PBldguhk1844jYwZzPr2dT3pQ3CdHtV8wHXlO8Zzhqjzh3
	 79Vr+NpW2JwDY1yGhIp+2Pl8ddaEFz3475RLSTBhTHr8iL5CYs6KOvDVV2Pd8dIgvQljJ
	 79W6BU/oKGJZ1SqJyGDpjL5NMyB+M9NjQhZHplRn1QX2lkIstpNr8a/RoJJhGO0MnROur
	 Nql8X/SCcs+aAsqEid7+hFpeYp1SCCDCaROAvJzpdOpBgXDQIflAbZv+JcGtHbns+qbzY
	 vUv6n99oREKN/vb4hy7lba6gFsATB3M4FMVynT8XGCsHPHma2dAQaxCvGq8ikaLyDmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659974;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=4JcSAbuT6942sR8q6dywoWRG5T3tN9v/pJZzgxKDtV8=;
	b=uxtOYjFCC8giyPgUKhz7SD/+2mtvu2G1kHVvHLRzTIYHt4bHRrOeehO+72Ztr8iS62Fj
	 Ma2acpdyCL0ebhcU1DX+mdhBUm7SE2KQbTTlgcsSX+zsk3rfuBLMR8nh5+r8f2uocjwAm
	 3O1ZFr7O+Fahkb3AbuZT5aZYe263tgcEOawcSNkdqbqWth75dGSasooPfWELRUsZRnQFU
	 +G++xG65MbE3GpkWRc/ZKY6M0npEdzeO6ZfXvQ/7am/tP15MQHa9YzDhDazNNbUf9g3+n
	 F2nBpxVv/jQvaAWmH1geekrjCtNEw113Wusis0Ba78PZctO6YGtGtnVO78dThpAFTXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=hbpzIdVE;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F26606A32F
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F26606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=hbpzIdVE
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id O05px3Ml7JFmFO0tTxAVqa; Mon, 02 Nov 2026 22:52:47 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tSxEiqRQfwNO0tSxXToM; Mon, 02 Nov 2026 22:52:47 +0000
X-Authority-Analysis: v=2.4 cv=bfprUPPB c=1 sm=1 tr=0 ts=6ae9143f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=3W0-DxZhAAAA:8
 a=VeVZoRYdAAAA:8 a=Jy0dmyxnAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=W7o7ocYhAAAA:8 a=iox4zFpeAAAA:8 a=8BzY99dkAAAA:8 a=EprCN7UrAAAA:8
 a=A5s3B-U6AAAA:8 a=-EZVVf1KdC3ZfcghbgAA:9 a=-pq1DBQL-ILSQNPjOI6a:22
 a=TKXEY2ph7vCcqc0JNG1P:22 a=QdD7hOnY_o00qASb27ph:22 a=9uIKRcg7Gvwk8o89M4RL:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=i9qZl794mjBmCNEFDYFV:22 a=HCbi7XInCiJmNhJA85EG:22
 a=CynZFG9aVJpx8NKJlbCV:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4JcSAbuT6942sR8q6dywoWRG5T3tN9v/pJZzgxKDtV8=; b=hbpzIdVEJSUK4W6ubU21sr4dpI
	0/+A09Kuijl5+xfs/R8wCK+CTugyj6fLTJQcX5yIJQg4u3QpPnirHsvUY/w861kzwN/7LbWfRmujn
	iXUAOL2x5lUOH1xQdoOQaUEmVklmd7tR7n6nAaca49T8lARPVe3rXwQ2vuGHFbqAqsrE/4DBAzcJQ
	9Rkj5s9CYSSse8T6GijV/cAE0YZcIeMM9epdgzWhd7IyOXY15zuubzlMCFw0LeBrxx7OT/UHa5IYm
	DWNVyr+hAY9WoO6k1/lYzaKMcpcRyrCcIx+j0Z5aEWrTupsE3yXkTI/XtGRBT4aVEZkhWWUWphkOo
	rSlnZssQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42248 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tR-00000003jdJ-3pqJ;
	Tue, 03 Nov 2026 04:22:46 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Alistair John Strachan <alistair@devzero.co.uk>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Denis Pauk <pauk.denis@gmail.com>,
	Ed Brindley <kernel@maidavale.org>,
	George Joseph <george.joseph@fairview5.com>,
	Hans de Goede <hansg@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Jack Doan <me@jackdoan.com>,
	James Seo <james@equiv.tech>,
	Jean Delvare <jdelvare@suse.com>,
	Jim Cromie <jim.cromie@gmail.com>,
	Jonas Malaco <jonas@protocubo.io>,
	Juerg Haefliger <juergh@proton.me>,
	Luca Tettamanti <kronos.it@gmail.com>,
	Marc Hulsman <m.hulsman@tudelft.nl>,
	Riku Voipio <riku.voipio@iki.fi>,
	Roger Lucas <vt8231@hiddenengine.co.uk>,
	Rudolf Marek <r.marek@assembler.cz>,
	Steve Glendinning <steve.glendinning@shawell.net>
Subject: [PATCH 000/102] hwmon: Fix 32-bit jiffies wraparound in sensor cache timestamps
Date: Mon,  2 Nov 2026 14:50:53 -0800
Message-ID: <20261102225235.334487-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xO0tR-00000003jdJ-3pqJ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42248
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 21
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIRgiXWCdXKJq893aW0HiWVhSS1ZlKY3hnccFppB7URskzMOmJGZ2cpcMcodAGLzPvKfOmbULWDYINhAdYaQThmGCNYU/O+nPQhPzkoqak7I+hh+kDa1
 E6TkQKbWKTqabaymBPrD+PqeLTBqVTeJd9xf7GQqQ/uRwwPIS+Z5omLMMh8zXBGPxMHlkyl/UJqbqiE1dqy7P+40W47uA/1d2yohzQ9C/B2fGdxWfqfFpdFl

Many hwmon drivers cache hardware register values and use 32-bit
jiffies comparisons (time_after(), time_before(), time_after_eq(),
time_before_eq(), or unsigned jiffies deltas) to determine when cached
readings or rate-limit intervals have expired. On 32-bit architectures,
unsigned long jiffies is 32 bits wide and signed delta comparisons wrap
around after MAX_JIFFY_OFFSET ticks (about 24.85 days at HZ=1000). If a
sensor is not polled for longer than that window, time_after()
evaluates to false (or time_before() to true) for another ~24.85 days
and stale cached values are returned instead of reading fresh values
from the hardware.

Sashiko finds more and more instances of this problem in drivers, and I
started seeing patches fixing individual drivers. So, instead of going
slow, I decided to handle all of them in one series.

This series audits drivers/hwmon and fixes all 101 remaining affected
drivers across 102 patches (two patches for asus_rog_ryujin), choosing
between 64-bit jiffies and ktime on a per-driver basis:

- 64-bit jiffies (78 drivers): Used where refresh intervals are
  expressed directly in HZ ticks (e.g., HZ, HZ + HZ / 2, 2 * HZ,
  60 * HZ) or where helper logic already operates in jiffies. These
  drivers are converted to u64 (or atomic64_t in adt7470 to preserve
  its lockless sysfs read fast-path), get_jiffies_64(), and the
  corresponding time_*64() helpers.

- ktime (23 drivers, 24 patches): Used where intervals are naturally
  expressed in milliseconds or microseconds (configurable millisecond
  conversion tables, sub-second intervals, or asynchronous USB HID
  status and control timeouts). These drivers are converted to ktime_t
  with ktime_get(), ktime_add_ms() / ktime_add_us(), ktime_ms_delta(),
  and ktime_after() / ktime_before(), avoiding both 32-bit jiffies
  wraparound and coarse msecs_to_jiffies() rounding on low-HZ kernels.

Because 64-bit timestamp loads and stores are non-atomic on 32-bit
architectures, all timestamp read/write paths were also checked for
serialization:

- Drivers registered via [devm_]hwmon_device_register_with_info()
  without unlocked custom paths are already serialized by hwdev->lock
  in the hwmon core.
- Where additional synchronization was required, locks were added or
  extended: hwmon_lock in asus_atk0110 and menf21bmc_hwmon, atomic64_t
  with acquire/release ordering on validity flags in adt7470, spinlocks
  synchronizing HID .raw_event and .read callbacks in
  aquacomputer_d5next, nzxt-kraken2, and nzxt-kraken3, and acquiring
  state->lock before checking last_updated in hp-wmi-sensors.

Auditing the timestamp logic also uncovered a few existing driver bugs
that are fixed in their respective patches:

- atxp1, ibmaem: Updated last_updated (and valid in ibmaem when all
  IPMI reads succeed), which were previously never written despite
  being checked.
- ds1621, ina209: Fixed millisecond update_interval values previously
  added directly to jiffies without unit conversion (enforcing a 1 ms
  minimum cache window in ina209 when single-sample conversion time
  truncates update_interval to 0 ms).
- f71805f: Fixed the limit cache expiration check comparing against
  data->last_updated instead of data->last_limits.
- w83792d: Fixed time_after() being passed a relative jiffies delta
  rather than absolute jiffies timestamps.

Note on tooling and testing:
This series was generated with an AI coding assistant (Jetski / Gemini)
prompted to audit drivers/hwmon for 32-bit jiffies wraparound issues
and convert affected drivers to 64-bit jiffies or ktime as appropriate,
followed by automated review (Sashiko) and manual inspection of flagged
drivers. All 102 patches were build-tested on arm, arm64, and x86_64
across all modified object files with zero warnings and verified with
scripts/checkpatch.pl --strict; they were not tested on physical sensor
hardware.

I plan to apply the series to hwmon-next. Some of the patches will find
their way into the 'hwmon' branch and be sent upstream, especially those
fixing other bugs or if the problem is reported by Sashiko in some other
context.

Cc: Aleksa Savic <savicaleksa83@gmail.com>
Cc: Alistair John Strachan <alistair@devzero.co.uk>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Denis Pauk <pauk.denis@gmail.com>
Cc: Ed Brindley <kernel@maidavale.org>
Cc: George Joseph <george.joseph@fairview5.com>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Cc: Jack Doan <me@jackdoan.com>
Cc: James Seo <james@equiv.tech>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Jim Cromie <jim.cromie@gmail.com>
Cc: Jonas Malaco <jonas@protocubo.io>
Cc: Juerg Haefliger <juergh@proton.me>
Cc: Luca Tettamanti <kronos.it@gmail.com>
Cc: Marc Hulsman <m.hulsman@tudelft.nl>
Cc: Riku Voipio <riku.voipio@iki.fi>
Cc: Roger Lucas <vt8231@hiddenengine.co.uk>
Cc: Rudolf Marek <r.marek@assembler.cz>
Cc: Steve Glendinning <steve.glendinning@shawell.net>

---
Guenter Roeck (102):
  hwmon: (abituguru) Use 64-bit jiffies for update timestamp
  hwmon: (abituguru3) Use 64-bit jiffies for update timestamp
  hwmon: (acpi_power_meter) Use ktime for sensor sampling interval
  hwmon: (ad7414) Use 64-bit jiffies for update deadline
  hwmon: (ad7418) Use 64-bit jiffies for update timestamp
  hwmon: (adc128d818) Use 64-bit jiffies for update timestamp
  hwmon: (adm1025) Use 64-bit jiffies for update timestamp
  hwmon: (adm1026) Use 64-bit jiffies for update timestamps
  hwmon: (adm1029) Use 64-bit jiffies for update timestamp
  hwmon: (adm1031) Use ktime for sensor update interval
  hwmon: (adt7411) Use 64-bit jiffies for vref update deadline
  hwmon: (adt7462) Use 64-bit jiffies for update timestamps
  hwmon: (adt7470) Use 64-bit jiffies for update timestamps
  hwmon: (adt7475) Use 64-bit jiffies for measurement timestamp
  hwmon: (aquacomputer_d5next) Use ktime for status update timestamp
  hwmon: (asb100) Use 64-bit jiffies for update timestamp
  hwmon: (asc7621) Use 64-bit jiffies for update timestamps
  hwmon: (asus_atk0110) Use 64-bit jiffies for sensor cache timestamp
  hwmon: (asus_rog_ryujin) Use ktime for status validity timestamp
  hwmon: (asus_wmi_sensors) Use 64-bit jiffies for source cache
    timestamps
  hwmon: (atxp1) Use 64-bit jiffies and record update timestamp
  hwmon: (dme1737) Use 64-bit jiffies for update timestamps
  hwmon: (ds1621) Use ktime for update timestamp
  hwmon: (ds620) Use 64-bit jiffies for update timestamp
  hwmon: (emc2103) Use 64-bit jiffies for update timestamp
  hwmon: (emc6w201) Use 64-bit jiffies for update timestamp
  hwmon: (f71805f) Use 64-bit jiffies for update timestamps
  hwmon: (f71882fg) Use 64-bit jiffies for update timestamps
  hwmon: (f75375s) Use 64-bit jiffies for update timestamps
  hwmon: (fschmd) Use 64-bit jiffies for update timestamp
  hwmon: (ftsteutates) Use 64-bit jiffies for update timestamp
  hwmon: (g760a) Use 64-bit jiffies for update timestamp
  hwmon: (g762) Use 64-bit jiffies for update timestamp
  hwmon: (gigabyte_waterforce) Use ktime for status validity timestamp
  hwmon: (gl518sm) Use 64-bit jiffies for update timestamp
  hwmon: (gl520sm) Use 64-bit jiffies for update timestamp
  hwmon: (hih6130) Use 64-bit jiffies for update timestamp
  hwmon: (hp-wmi-sensors) Use 64-bit jiffies for sensor cache timestamps
  hwmon: (ibmaem) Use 64-bit jiffies and record update timestamps
  hwmon: (ibmpex) Use 64-bit jiffies for update timestamp
  hwmon: (ina209) Use ktime for update timestamp
  hwmon: (it87) Use 64-bit jiffies for update timestamp
  hwmon: (kbatt) Use 64-bit jiffies for update deadline
  hwmon: (lineage-pem) Use 64-bit jiffies for update timestamp
  hwmon: (lm63) Use ktime for update timestamps
  hwmon: (lm77) Use 64-bit jiffies for update timestamp
  hwmon: (lm78) Use 64-bit jiffies for update timestamp
  hwmon: (lm80) Use 64-bit jiffies for update timestamp
  hwmon: (lm85) Use 64-bit jiffies for update timestamps
  hwmon: (lm87) Use 64-bit jiffies for update timestamp
  hwmon: (lm90) Use ktime for update timestamps
  hwmon: (lm93) Use 64-bit jiffies for update timestamp
  hwmon: (lm95241) Use ktime for update timestamp
  hwmon: (ltc4151) Use ktime for update timestamp
  hwmon: (ltc4215) Use ktime for update timestamp
  hwmon: (ltc4245) Use 64-bit jiffies for update timestamp
  hwmon: (ltc4261) Use ktime for update timestamp
  hwmon: (max16065) Use 64-bit jiffies for update timestamp
  hwmon: (max31790) Use 64-bit jiffies for update timestamp
  hwmon: (max6620) Use 64-bit jiffies for update timestamp
  hwmon: (max6650) Use 64-bit jiffies for update timestamp
  hwmon: (menf21bmc_hwmon) Use 64-bit jiffies for update timestamp
  hwmon: (nct6683) Use 64-bit jiffies for update timestamp
  hwmon: (nct6775) Use 64-bit jiffies for update timestamp
  hwmon: (nsa320-hwmon) Use 64-bit jiffies for update timestamp
  hwmon: (nzxt-kraken2) Use ktime for status report validity timestamp
  hwmon: (nzxt-kraken3) Use ktime for status report validity timestamp
  hwmon: (occ) Use 64-bit jiffies for poll and safe-state timestamps
  hwmon: (pc87360) Use 64-bit jiffies for update timestamp
  hwmon: (pc87427) Use 64-bit jiffies for update timestamp
  hwmon: (peci) Use 64-bit jiffies for sensor update timestamps
  hwmon: (powr1220) Use 64-bit jiffies for ADC update timestamps
  hwmon: (sch5627) Use 64-bit jiffies for update timestamps
  hwmon: (sch5636) Use 64-bit jiffies for update timestamp
  hwmon: (sht15) Use 64-bit jiffies for status and measurement
    timestamps
  hwmon: (sht21) Use ktime for measurement update timestamp
  hwmon: (sht3x) Use ktime for periodic mode update timestamp
  hwmon: (sht4x) Use 64-bit jiffies for poll timestamp
  hwmon: (shtc1) Use ktime for measurement update timestamp
  hwmon: (sis5595) Use 64-bit jiffies for update timestamp
  hwmon: (smsc47b397) Use 64-bit jiffies for update timestamp
  hwmon: (smsc47m1) Use 64-bit jiffies for update timestamp
  hwmon: (smsc47m192) Use 64-bit jiffies for update timestamp
  hwmon: (stts751) Use ktime for temperature and alert cache timestamps
  hwmon: (tc654) Use 64-bit jiffies for update timestamp
  hwmon: (tc74) Use ktime for temperature cache timestamp
  hwmon: (thmc50) Use ktime for register cache timestamp
  hwmon: (tmp421) Use ktime for temperature cache timestamp
  hwmon: (tmp464) Use ktime for fault register cache timestamp
  hwmon: (via686a) Use 64-bit jiffies for update timestamp
  hwmon: (vt1211) Use 64-bit jiffies for update timestamp
  hwmon: (vt8231) Use 64-bit jiffies for update timestamp
  hwmon: (w83627ehf) Use 64-bit jiffies for update timestamp
  hwmon: (w83627hf) Use 64-bit jiffies for update timestamp
  hwmon: (w83781d) Use 64-bit jiffies for update timestamp
  hwmon: (w83791d) Use 64-bit jiffies for update timestamp
  hwmon: (w83792d) Use 64-bit jiffies for update timestamp
  hwmon: (w83793) Use 64-bit jiffies for update timestamps
  hwmon: (w83795) Use 64-bit jiffies for update timestamp
  hwmon: (w83l785ts) Use 64-bit jiffies for update timestamp
  hwmon: (w83l786ng) Use 64-bit jiffies for update timestamp
  hwmon: (asus_rog_ryujin) Use ktime for pump source change timestamp

 drivers/hwmon/abituguru.c           |  8 ++---
 drivers/hwmon/abituguru3.c          |  7 ++--
 drivers/hwmon/acpi_power_meter.c    | 15 ++++----
 drivers/hwmon/ad7414.c              |  6 ++--
 drivers/hwmon/ad7418.c              |  8 ++---
 drivers/hwmon/adc128d818.c          |  7 ++--
 drivers/hwmon/adm1025.c             |  7 ++--
 drivers/hwmon/adm1026.c             | 17 ++++-----
 drivers/hwmon/adm1029.c             |  7 ++--
 drivers/hwmon/adm1031.c             | 14 ++++----
 drivers/hwmon/adt7411.c             | 10 +++---
 drivers/hwmon/adt7462.c             | 19 ++++++-----
 drivers/hwmon/adt7470.c             | 48 +++++++++++++++++---------
 drivers/hwmon/adt7475.c             |  6 ++--
 drivers/hwmon/aquacomputer_d5next.c | 27 +++++++++++----
 drivers/hwmon/asb100.c              |  8 ++---
 drivers/hwmon/asc7621.c             | 14 ++++----
 drivers/hwmon/asus_atk0110.c        |  9 ++---
 drivers/hwmon/asus_rog_ryujin.c     | 30 ++++++++--------
 drivers/hwmon/asus_wmi_sensors.c    |  7 ++--
 drivers/hwmon/atxp1.c               |  6 ++--
 drivers/hwmon/dme1737.c             | 14 ++++----
 drivers/hwmon/ds1621.c              | 10 +++---
 drivers/hwmon/ds620.c               |  6 ++--
 drivers/hwmon/emc2103.c             |  6 ++--
 drivers/hwmon/emc6w201.c            |  7 ++--
 drivers/hwmon/f71805f.c             | 12 +++----
 drivers/hwmon/f71882fg.c            | 13 +++----
 drivers/hwmon/f75375s.c             | 12 +++----
 drivers/hwmon/fschmd.c              |  7 ++--
 drivers/hwmon/ftsteutates.c         |  7 ++--
 drivers/hwmon/g760a.c               |  7 ++--
 drivers/hwmon/g762.c                |  7 ++--
 drivers/hwmon/gigabyte_waterforce.c | 11 +++---
 drivers/hwmon/gl518sm.c             |  6 ++--
 drivers/hwmon/gl520sm.c             |  7 ++--
 drivers/hwmon/hih6130.c             |  7 ++--
 drivers/hwmon/hp-wmi-sensors.c      | 12 +++----
 drivers/hwmon/ibmaem.c              | 53 +++++++++++++++++++----------
 drivers/hwmon/ibmpex.c              |  7 ++--
 drivers/hwmon/ina209.c              | 14 ++++++--
 drivers/hwmon/it87.c                |  6 ++--
 drivers/hwmon/kbatt.c               |  8 +++--
 drivers/hwmon/lineage-pem.c         |  7 ++--
 drivers/hwmon/lm63.c                | 20 +++++------
 drivers/hwmon/lm77.c                |  6 ++--
 drivers/hwmon/lm78.c                |  6 ++--
 drivers/hwmon/lm80.c                |  7 ++--
 drivers/hwmon/lm85.c                | 14 ++++----
 drivers/hwmon/lm87.c                |  7 ++--
 drivers/hwmon/lm90.c                | 20 ++++++-----
 drivers/hwmon/lm93.c                |  6 ++--
 drivers/hwmon/lm95241.c             | 10 +++---
 drivers/hwmon/ltc4151.c             | 10 +++---
 drivers/hwmon/ltc4215.c             |  9 ++---
 drivers/hwmon/ltc4245.c             |  9 ++---
 drivers/hwmon/ltc4261.c             |  9 ++---
 drivers/hwmon/max16065.c            |  7 ++--
 drivers/hwmon/max31790.c            |  7 ++--
 drivers/hwmon/max6620.c             |  7 ++--
 drivers/hwmon/max6650.c             |  7 ++--
 drivers/hwmon/menf21bmc_hwmon.c     | 19 +++++------
 drivers/hwmon/nct6683.c             |  7 ++--
 drivers/hwmon/nct6775-core.c        |  6 ++--
 drivers/hwmon/nct6775.h             |  2 +-
 drivers/hwmon/nsa320-hwmon.c        |  7 ++--
 drivers/hwmon/nzxt-kraken2.c        | 37 ++++++++++++++------
 drivers/hwmon/nzxt-kraken3.c        | 27 ++++++++++-----
 drivers/hwmon/occ/common.c          | 12 +++----
 drivers/hwmon/occ/common.h          |  4 +--
 drivers/hwmon/pc87360.c             |  7 ++--
 drivers/hwmon/pc87427.c             |  8 ++---
 drivers/hwmon/peci/common.h         | 12 ++++---
 drivers/hwmon/powr1220.c            |  6 ++--
 drivers/hwmon/sch5627.c             | 26 +++++++-------
 drivers/hwmon/sch5636.c             |  7 ++--
 drivers/hwmon/sht15.c               | 16 ++++-----
 drivers/hwmon/sht21.c               | 11 +++---
 drivers/hwmon/sht3x.c               | 13 +++----
 drivers/hwmon/sht4x.c               |  8 ++---
 drivers/hwmon/shtc1.c               |  8 +++--
 drivers/hwmon/sis5595.c             |  6 ++--
 drivers/hwmon/smsc47b397.c          |  7 ++--
 drivers/hwmon/smsc47m1.c            |  7 ++--
 drivers/hwmon/smsc47m192.c          |  8 ++---
 drivers/hwmon/stts751.c             | 24 +++++++------
 drivers/hwmon/tc654.c               |  7 ++--
 drivers/hwmon/tc74.c                |  8 ++---
 drivers/hwmon/thmc50.c              | 13 +++----
 drivers/hwmon/tmp421.c              | 10 +++---
 drivers/hwmon/tmp464.c              | 11 +++---
 drivers/hwmon/via686a.c             |  6 ++--
 drivers/hwmon/vt1211.c              |  7 ++--
 drivers/hwmon/vt8231.c              |  8 ++---
 drivers/hwmon/w83627ehf.c           | 10 +++---
 drivers/hwmon/w83627hf.c            |  8 ++---
 drivers/hwmon/w83781d.c             |  8 ++---
 drivers/hwmon/w83791d.c             |  8 ++---
 drivers/hwmon/w83792d.c             |  9 +++--
 drivers/hwmon/w83793.c              | 17 ++++-----
 drivers/hwmon/w83795.c              |  8 ++---
 drivers/hwmon/w83l785ts.c           |  7 ++--
 drivers/hwmon/w83l786ng.c           |  8 ++---
 103 files changed, 641 insertions(+), 494 deletions(-)

-- 
2.56.0
