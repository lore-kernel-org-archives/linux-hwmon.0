Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536701;
	b=2vIfm41QUFsUTA0cRbrP0ix68aEOsynKLsjptDthSBg4PsPkLUsA6uhg9cQ90oWAqcjL
	 2hWx9IiIMfpFeFu6EBSksCARJIZrk/WzDI8AiZL0TwyW8N6cZ43kCxzM20QEJ+wQjjhTc
	 UdeXOIo41/PxCZ9zlE6kvnd7p6tyMpbDH66a0g+WKwty8tQb+1VvVQGHrmeuLLa8sYKwH
	 VxDTBETERXx7AdTC8AhA4cC52J5hfNm2VZ1T0SLO6nexcq0/6TLtpCGbAOZFJrRVb8jXz
	 lrkfuI7nQ6HfG81J1+gi4v/Rfk+d+7M14VDlE7DFTseSPtj6GJww4jTIvY7cknEw9Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536701;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6h01NZLrce8q5xegaK9woLUiSj/gVMmmjyFh611rXaM=;
	b=Upjx4VmYt7fzB6yQEBX6Crlv6nsv+aLGD8h/yywwnBxm0QFxBCxW8onJM8heln3eHSV9
	 V/iMO3/MEDSpZbLboe6i/ND9/HVD64zWd4fZE1tw8GqZBmwRa4m2mSSRaeqcghusNl3FP
	 z45iyj+2hcmPlmE6v6I7Ia9ycVQF3YhRtQ2CgZlSJY9WOQgX6or/TFl4BqyGr7ndoU4ai
	 pwuPpymKgvjCT36P5yQKPKguO+KdRtbJ61A8ynMglYwil1KyDwej2W5pWoWXhRnBTDm/j
	 AGk/nbkyCK+0cOBwqKarYgr/D8jcfHbBhLuJJTAZpPYUwvpm5rPjkcVZx9TNVbB7IGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qw4X39Dv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD49B606A319
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 22:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qw4X39Dv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A26E1F000C9;
	Tue, 20 Oct 2026 22:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792536700;
	bh=6h01NZLrce8q5xegaK9woLUiSj/gVMmmjyFh611rXaM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qw4X39DvSUvf0BJ2HX9VBoioXkg+xKmDAK5hxh+bsf2xLf910YQUdfrkp2WYxT/Uw
	 N9aI0hJnOoA8+543E8S0DF2b1gEDx42JSzZiA0OO6MBDHZc0XogIc7KEghqZGQ93JM
	 qfGcpsNplcZmLonVJOgHXC4XFnyWbqjs6zCRSLrV6is0DG/jX7bn2MpHeKKDSDCYwL
	 LJQk2zki43mHI9idT1/hOh7DCenPqOi1jECV1bF6TVQuqVxcBtvO8Xd4CWx41FgWx3
	 NExTRHtrq05+HD7wFlYz38qPN2wc0lrpTJeD2WrAmj/kj2PpCLAF8dmgeu7fCcwSbv
	 MfnZeHuWHwQ+Q==
Message-ID: <sashiko-outbox-179583@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-4-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v3-4-51df629e13d7@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 22:51:39 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with PMBus
> telemetry for input voltage, output voltage and temperature, plus the
> matching status registers. The FS1525 also reports output current and
> has an over-temperature warning limit. The FS1412 has neither:
> READ_IOUT and OT_WARN_LIMIT are not in its command table. Both read
> "KDT" from MFR_ID, which the driver checks before binding, and are
> told apart by IC_DEVICE_ID (0x0c for the FS1412, 0x19 for the FS1525).
>=20
> VOUT_MODE is read-only and has bit 7 set on both: 0x98 on the FS1412
> (exponent -8) and 0x96 on the FS1525 (exponent -10). Their output
> voltage limits are relative to VOUT_COMMAND, so 0x0133 against a 0.6V
> command is a 120% over-voltage limit on the FS1412. The PMBus core
> converts them now that it supports relative VOUT encoding.
>=20
> On the FS1412, OT_WARN_LIMIT answers although it is not in the command
> table, but the part reports OT_WARNING at room temperature, so the
> driver hides the register from the core and only the OT_FAULT_LIMIT
> based attributes are provided.
>=20
> When the output is set with an external divider, the FS1412 reports
> READ_VOUT at the feedback pin, so in2_input and its limits all scale
> with the divider in user space. The FS1525 reports READ_VOUT as the
> output voltage and compares it against its warning and under-voltage
> limits as they are, relative to VOUT_COMMAND. Its over-voltage fault
> is an analog comparison at the feedback pin, which would read below
> in2_input on such boards, so the driver hides VOUT_OV_FAULT_LIMIT on
> the FS1525.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-hwmon-pmbu=
s-fs1412-v3-0-51df629e13d7@nexthop.ai?part=3D4

