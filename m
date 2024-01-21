Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2464333CC0
	for <linux-hwmon@vger.kernel.org>; Sun, 21 Jan 2024 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705850340; cv=none; b=QWO7lF611SuhjwZ/TKb9mwjddS28Hpl99EON5LPRKSbKM4KpWQ7JrAwgLII4KUwrfsFUcMYtKgKlVUljuNszwf939FDKE0nV8Xjkx+pmDONm4Bz/54Er3sQZAitzrcT4T65S5ajsEbiQZ90P7+TuthIWmwMIr0i0D/jUfrU2k6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705850340; c=relaxed/simple;
	bh=VNIurrISjzYJaMl+6shjB/Dl0qIVZuivieQuv3Cie5A=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=udNQtJ/yD1lSIG2AJstAet7Y4oDzG+QJ/DIc7l7wkU7GTatxm+ZkEQInYEHeTf4yN80ll1f4FD/q/OYXu8KOR8I86AQgKhWsWA9ThP7g2/5yAnfSVJMy7+h7zA6Jc3UQgikvK7SrLjRSIPEjBVknSyZ0EadXtKz88RzCb+EoffQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schebbelaar.nl; spf=pass smtp.mailfrom=schebbelaar.nl; dkim=pass (2048-bit key) header.d=schebbelaar.nl header.i=@schebbelaar.nl header.b=c4XjA+uB; arc=none smtp.client-ip=185.70.40.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schebbelaar.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schebbelaar.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schebbelaar.nl header.i=@schebbelaar.nl header.b="c4XjA+uB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schebbelaar.nl;
	s=protonmail3; t=1705850328; x=1706109528;
	bh=bFGNm6DZFia0dssqLtGrrVDjAPqwKp4zYoJpvfKZp/8=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=c4XjA+uByFxgzJPPiNF2OG/avJRRjhd3UIN8EoBNWslQBmLB9dT/Bz+67MoIIGdVd
	 M5vFbDXDBTAwaSFfTwZni0mhIK8A8sqzSTE1hYW1IrRZKY9MbZjx2ushQA1yFX2eTG
	 9HeWv0c0UZsvpPwvJYeqQ+GrQ/7+bA18hpdGTeVBys+ju8WzxPImQ82l+TP8zD/Vlh
	 yzLbFXUfEtg4+sF0mMoVo3OFVK+gp7opkD09e4xw6gp1Hbl/On2yfRlv+cFkMYPl4p
	 2MRjlZNvehXlAW5SQfHrHD4xAMyUQkL1iNO/E7i+AhoLcHlYAv/IAU982AerY/5Qe3
	 IEsIB7bJg14uA==
Date: Sun, 21 Jan 2024 15:18:29 +0000
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From: willem <willem@schebbelaar.nl>
Subject: NCT6686D / asrock b650i / no sensors found
Message-ID: <1BoBmwY1Yd95I3Djzan27UWua1aOxSS6Qn7DVY6L6saX0j7DH2aom_djcS1ZSdZ99bZ0Z25-QdIcjpU4yoMRCydi34kk2D9CPtxgEokJRbk=@schebbelaar.nl>
Feedback-ID: 63001121:user:proton
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I've got an asrock b650i motherboard, the manual says it has an NCT6686D ch=
ip. Is ther a method to detect this chip?



uname -a
Linux athene 6.6.13-1-lts #1 SMP PREEMPT_DYNAMIC Sat, 20 Jan 2024 14:48:01 =
+0000 x86_64 GNU/Linux


modprobe nct6683
[    4.866999] nct6683: Found NCT6686D or compatible chip at 0x2e:0xa20


sensors
k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +41.4=C2=B0C =20
Tccd1:        +30.5=C2=B0C =20

nvme-pci-0100
Adapter: PCI adapter
Composite:    +31.9=C2=B0C  (low  =3D  -0.1=C2=B0C, high =3D +85.8=C2=B0C)
                       (crit =3D +87.8=C2=B0C)
Sensor 1:     +31.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=
=C2=B0C)

mt7921_phy0-pci-0700
Adapter: PCI adapter
temp1:        +30.0=C2=B0C =20

amdgpu-pci-0c00
Adapter: PCI adapter
vddgfx:      760.00 mV=20
vddnb:         1.28 V =20
edge:         +39.0=C2=B0C =20
PPT:          29.00 W =20


sensors-detect=20
# sensors-detect version 3.6.0+git
# System: ASRock B650I Lightning WiFi [Default string]
# Kernel: 6.6.13-1-lts x86_64
# Processor: AMD Ryzen 7 7800X3D 8-Core Processor (25/97/2)

This program will help you determine which kernel modules you need
to load to use lm_sensors most effectively. It is generally safe
and recommended to accept the default answers to all questions,
unless you know what you're doing.

Some south bridges, CPUs or memory controllers contain embedded sensors.
Do you want to scan for them? This is totally safe. (YES/no):=20
Silicon Integrated Systems SIS5595...                       No
VIA VT82C686 Integrated Sensors...                          No
VIA VT8231 Integrated Sensors...                            No
AMD K8 thermal sensors...                                   No
AMD Family 10h thermal sensors...                           No
AMD Family 11h thermal sensors...                           No
AMD Family 12h and 14h thermal sensors...                   No
AMD Family 15h thermal sensors...                           No
AMD Family 16h thermal sensors...                           No
AMD Family 17h thermal sensors...                           No
AMD Family 15h power sensors...                             No
AMD Family 16h power sensors...                             No
Hygon Family 18h thermal sensors...                         No
AMD Family 19h thermal sensors...                           No
Intel digital thermal sensor...                             No
Intel AMB FB-DIMM thermal sensor...                         No
Intel 5500/5520/X58 thermal sensor...                       No
VIA C7 thermal sensor...                                    No
VIA Nano thermal sensor...                                  No

Some Super I/O chips contain embedded sensors. We have to write to
standard I/O ports to probe them. This is usually safe.
Do you want to scan for Super I/O sensors? (YES/no):=20
Probing for Super-I/O at 0x2e/0x2f
Trying family `National Semiconductor/ITE'...               No
Trying family `SMSC'...                                     No
Trying family `VIA/Winbond/Nuvoton/Fintek'...               Yes
Found unknown chip with ID 0xd441
Probing for Super-I/O at 0x4e/0x4f
Trying family `National Semiconductor/ITE'...               No
Trying family `SMSC'...                                     No
Trying family `VIA/Winbond/Nuvoton/Fintek'...               No
Trying family `ITE'...                                      No

Some systems (mainly servers) implement IPMI, a set of common interfaces
through which system health data may be retrieved, amongst other things.
We first try to get the information from SMBIOS. If we don't find it
there, we have to read from arbitrary I/O ports to probe for such
interfaces. This is normally safe. Do you want to scan for IPMI
interfaces? (YES/no):=20
Probing for `IPMI BMC KCS' at 0xca0...                      No
Probing for `IPMI BMC SMIC' at 0xca8...                     No

Some hardware monitoring chips are accessible through the ISA I/O ports.
We have to write to arbitrary I/O ports to probe them. This is usually
safe though. Yes, you do have ISA I/O ports even if you do not have any
ISA slots! Do you want to scan the ISA I/O ports? (YES/no):=20
Probing for `National Semiconductor LM78' at 0x290...       No
Probing for `National Semiconductor LM79' at 0x290...       No
Probing for `Winbond W83781D' at 0x290...                   No
Probing for `Winbond W83782D' at 0x290...                   No

Lastly, we can probe the I2C/SMBus adapters for connected hardware
monitoring devices. This is the most risky part, and while it works
reasonably well on most systems, it has been reported to cause trouble
on some systems.
Do you want to probe the I2C/SMBus adapters now? (YES/no):=20
Using driver `i2c-piix4' for device 0000:00:14.0: AMD KERNCZ SMBus

Next adapter: AMDGPU DM i2c hw bus 0 (i2c-0)
Do you want to scan it? (yes/NO/selectively):=20

Next adapter: AMDGPU DM i2c hw bus 1 (i2c-1)
Do you want to scan it? (yes/NO/selectively):=20

Next adapter: AMDGPU DM i2c hw bus 2 (i2c-2)
Do you want to scan it? (yes/NO/selectively):=20

Next adapter: AMDGPU DM i2c hw bus 3 (i2c-3)
Do you want to scan it? (yes/NO/selectively):=20

Next adapter: AMDGPU DM aux hw bus 1 (i2c-4)
Do you want to scan it? (yes/NO/selectively):=20

Next adapter: AMDGPU DM aux hw bus 3 (i2c-5)
Do you want to scan it? (yes/NO/selectively):=20

Next adapter: SMBus PIIX4 adapter port 0 at 0b00 (i2c-6)
Do you want to scan it? (YES/no/selectively):=20
Client found at address 0x48
Probing for `National Semiconductor LM75'...                No
Probing for `National Semiconductor LM75A'...               No
Probing for `Dallas Semiconductor DS75'...                  No
Probing for `National Semiconductor LM77'...                No
Probing for `Analog Devices ADT7410/ADT7420'...             No
Probing for `Analog Devices ADT7411'...                     No
Probing for `Maxim MAX6642'...                              No
Probing for `Texas Instruments TMP435'...                   No
Probing for `National Semiconductor LM73'...                No
Probing for `National Semiconductor LM92'...                No
Probing for `National Semiconductor LM76'...                No
Probing for `Maxim MAX6633/MAX6634/MAX6635'...              No
Probing for `NXP/Philips SA56004'...                        No
Probing for `SMSC EMC1023'...                               No
Probing for `SMSC EMC1043'...                               No
Probing for `SMSC EMC1053'...                               No
Probing for `SMSC EMC1063'...                               No
Client found at address 0x4a
Probing for `National Semiconductor LM75'...                No
Probing for `National Semiconductor LM75A'...               No
Probing for `Dallas Semiconductor DS75'...                  No
Probing for `National Semiconductor LM77'...                No
Probing for `Analog Devices ADT7410/ADT7420'...             No
Probing for `Analog Devices ADT7411'...                     No
Probing for `Maxim MAX6642'...                              No
Probing for `Texas Instruments TMP435'...                   No
Probing for `National Semiconductor LM73'...                No
Probing for `National Semiconductor LM92'...                No
Probing for `National Semiconductor LM76'...                No
Probing for `Maxim MAX6633/MAX6634/MAX6635'...              No
Probing for `NXP/Philips SA56004'...                        No
Client found at address 0x50
Probing for `Analog Devices ADM1033'...                     No
Probing for `Analog Devices ADM1034'...                     No
Probing for `SPD EEPROM'...                                 No
Probing for `EDID EEPROM'...                                No
Client found at address 0x52
Probing for `Analog Devices ADM1033'...                     No
Probing for `Analog Devices ADM1034'...                     No
Probing for `SPD EEPROM'...                                 No

Next adapter: SMBus PIIX4 adapter port 2 at 0b00 (i2c-7)
Do you want to scan it? (YES/no/selectively):=20

Next adapter: SMBus PIIX4 adapter port 1 at 0b20 (i2c-8)
Do you want to scan it? (YES/no/selectively):=20

Sorry, no sensors were detected.
Either your system has no sensors, or they are not supported, or
they are connected to an I2C or SMBus adapter that is not
supported. If you find out what chips are on your board, check
https://hwmon.wiki.kernel.org/device_support_status for driver status.



Thanks,
Willem
