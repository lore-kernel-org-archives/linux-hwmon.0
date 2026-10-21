Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552106;
	b=eNtxZpM2T/r4JGqf+qDWZ7hcX5dtrvh3ABGTa+xroJYo+8rtxT3piG1/Dq/m64iljMDX
	 8W7x8Y9zIpLVIJCZ7hftMDiqpeJlOf5eW+VcD6PzzT9OJJjfTwiiVTsSHWWG/N4skfAkV
	 yxp2odtloCTewpIRE6ePvFFcHNnpM3/VdOPDqv04PimwIcaSKO5oXuGwOwXTD2ST47krA
	 la6RbfO/QJaCRjxVRzAhO8jSlgv4N8L0Jt89g9MCZsiovN5rWbqPZ52HBigDDt6j+wC3f
	 H009owqaSp72ytsOFF45w4XvZexz3WTkRcujBpWRbLraD5Z5VeVuVXDL7CCptfZY7Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552106;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UwXtqnF6lQ90zvUqY1AqXbsuyQQ14QxHVv5uw8NDKGI=;
	b=DjKvasXJsEHNeCs+nU/0Wg6lwaPNpk5rVyjrvlLY0AP1CYmdp3gg/+GXsQeLxwqbKESt
	 52PU/tsC7B4AYAT3aFFBFT1mB3ILMrJy4FK2J9I9XT4SJ+NgJKLVPQGNESGYkjeuTMkI8
	 D8uoxjY/QS9AVhE85PJASFk+9Ys5Uuuq/HpbbyVIHxqH86V3ZNYkFPXImCrNOs9fiMZjB
	 Y9BIpz0x0svqWYWqFIXnTCrcbdXzAFteCpPuznD/fbOTgN37jOm41QWKdtnLgCwY2ehkt
	 c2UZW8KZOV3AjoftVZEjJcDsEGppWxKaqcH+NePQOcgLGFclKiLeQiTh/fUn+3PD8Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R8CWElUq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0477606A319
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 03:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R8CWElUq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B02E1F000C9;
	Wed, 21 Oct 2026 03:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792552106;
	bh=UwXtqnF6lQ90zvUqY1AqXbsuyQQ14QxHVv5uw8NDKGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R8CWElUq0appA11bogDpHm1Csc7LWYyaGMmVN5f8cKVWwLz44WeB87Z8mB+6d1oZI
	 UYKUEEzj8XCNChPiwS6jPCeyDuCrIzi684SM0hTMCINT/a0sWqtjj6UDwXGvB23z8x
	 lUMu38/4oO4j1ZPDDN6Cy2xk/xlmqiT/HbNjv1MmPcTXj79wU0+PkT518+YQbfYHv8
	 6AkUAvuC9M1UTk8lL4o5NmAJtJx42m+kDNlLqpWwkqngNgMRytdKdREWb+hiurWafD
	 kfOnIoAK+w6bSITvnRoEg23jm6HNce0hFyqsDhtu3BE8LC7mC3qcHDagVG4dXTaRKi
	 fNfg6WMyYgGsw==
Message-ID: <sashiko-outbox-179742@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-4-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-4-27ece4e43d04@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 03:08:25 +0000
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
s-fs1412-v4-0-27ece4e43d04@nexthop.ai?part=3D4

