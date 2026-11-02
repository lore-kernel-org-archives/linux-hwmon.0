Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593993;
	b=Tfz3CnjpAra9smCoGY0/+TPNDRS/Amx2x2EABekg3FvlI/EVKzUJGyBCnswbPmAbeoXp
	 w1Qea3ZHP9JZPggKHTe4JsXEr7GNfxxk/yTX/EFoF5zabOyC20D7yFdetIqm2LGxFNVb4
	 E0Re/ZwOOTaR2/fxNShkzL3UDHfPK8lEo4HtUVqqhjm79HHCyaxoTvpGYi5/M2l4EcBOu
	 9WJAm1xVZsT96KFB4R37a2gMkS3bL3Z1cRkadQeqKePz1H7soMcGiDOka57m605ZMvTmG
	 WFEy7eNk7iVTAWPgwcxaY5Wan0ObrtlX2/jFndyt0952K2r3BU9WB3up8q+RZogqaew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593993;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=CufXGU4LWEDXeRZeyJPsC7MyMzR/8Ar5Nm83nez+D0w=;
	b=h6hoiORM4CggPQJ+reggXfM5TqtCGzEI6T2QlnEEvVifJG/Kab9Go+aX/n9ncMWvzKUL
	 s7GYXcZTb/Lbu7D6OlNBWRONoWRZPwi1Zihy4x1oDYzGyvv/acMasOyxqf9S/+zZSpvOU
	 UNm5Iicpmr7SwRaVJLRTXvSU6ZcA+Dpq77o8gd1AXiR1bnukz24CFTbZMx4xoQ8CT55LL
	 2pTfc9XIvLhhS41MTdjuDnGxOZ4G/mQlrbM1bkDZ2otLYt+ad3JFZsZc6DBOmxI67D441
	 H8Mq8p0/Rg98vy3iYaLwsCnz3zMImmUvucZ3Rt8synR58LRutWZNsMaRRccz7qx9sKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NrmivTIt;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E062606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 04:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E062606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NrmivTIt
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1546994a12.2
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 20:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593992; x=1794198792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CufXGU4LWEDXeRZeyJPsC7MyMzR/8Ar5Nm83nez+D0w=;
        b=iX+VJLcdYI28DF5eEfKCsUBNgCUu8oXK6z+L/E6ZGu3wA6VHy9b6PYgattDTR/C+GF
         GaOCLz7525sHLO4XJmeXPAN6gZtTtbm2KLk+kQtzc5aHGK5v32H/5W08+OHE7bItCZwr
         c0aAGyZvIX2L+iZhadsqennBVBIaUf/JHSnCUk28H0EbEReIJjo3BM0vHDcyH3FElV1g
         4ViO9gtAixfnsuwYb/iCnhBLzz52wSxNUi02IpznLv9Mu4bYT3UbH5LEYFzbeA96MWQe
         eTtENj6N6YqcbSrq8qkWeGwwZSpk34Ool39jjOughXxr4aPT6hZpQr3iWR9G6umivMFO
         W7Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxgtASKKkoyUXIkXhxHfN/O+bX3+DA4EBAdqcg6b9Qq3TljX1MskOCYnJ0+gMocF2si+y2rlvjNysLj4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1Ll7xbdK11ZVZbiIZAtYhPURo6KFiokYj0v2WuDxjunhKX3vk
	jTJxJ6Yf/dhi3TeTH+/q+coP31GnHSYzMLma0km/npIWdhzHrS6i14eRxct+YkOi4iT4WogRvQu
	FTfdC1O6rETp4oTZWX3P+5iiKfgq2iCIxjZiAGymxzFiXJUMzsY197dJsyHnK9AtdCwBZAVlETb
	jPp9szMxYe5NdDOOy90UaUWgJ5LprvhWaAFTV+Rtz72OTDTYaWMKndVVidA6B3eXKTho3bZ0ncB
	CRUVNFdUdIULdxPdm4=
X-Gm-Gg: AYBFou29vVIljFSIRHlc8v9wbMsOufLt3mVRRVdrOwjIqP9bR2QhayzUY6B2psY40ha
	BUo7XY+lO7vYg/ZjJzYFEATG5lU6uOoyLcmbhW8T4VjkOXSONEqGg8bDK0qTIv5+dmznFjSUvG/
	rEcd0mrkIIwG1dN5q0x/izi4rSzZV1SgTbr6h+HrV2A5eIMZWEN0CPawAJ4QbtOF/Icnuxjgvur
	HZLQRnta/7UGO0lCsLO1yC3CA7udLOUAAh0xSAPsdBmoN+gdKn4ADS3nNbxFVvdTQA1sjdVmdtS
	TQBaqJcGeFgDj8y+xyRZ9C6UT1mn6YSjGRYG/E4fUgJ2G/dfSEPkajfp9vYlXcVzaIdAlaqf4rc
	w082LFP8wyzC5rzKUeZeyZZGBRRHHMkS+1EEg7KLjP1i3Nq/oURm55Z76zbSUajKviPdd8U9AdR
	bjK34BPr/VoHDx6zw88Zru56YUglRiBIpybWlb
X-Received: by 2002:a17:90a:b890:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3ae8e5bdcc9mr5058673a91.5.1793593991693;
        Sun, 01 Nov 2026 20:33:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae87fdab62sm2829949a91.2.2026.11.01.20.33.11
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Nov 2026 20:33:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8ab43f7f5faso45133667b3.2
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 20:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793593990; x=1794198790; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CufXGU4LWEDXeRZeyJPsC7MyMzR/8Ar5Nm83nez+D0w=;
        b=NrmivTItkZ28b+7nMngODTAK2gECT6DWkTj8zR7cYjRi7l3qcpAzs4nUVIEmJd/78M
         1GHzaZ0CDLBGDjqXMhfbDQgplFXU/7b2NpQTU9c+spYOWBeeyzmgZix72sKs1SQWy9w8
         ynZog4Q6czoGfxvZ9h5uuCTKEOD7KevpPwL84=
X-Forwarded-Encrypted: i=1; AKwUvBxFiKs7GwwOnG86IOUW+IB03lzrBJeAHXL2j02PuQ1pmwC4k8N3rbVZ3mJyYd5lmzdeE+K/Y467KRxxQw==@vger.kernel.org
X-Received: by 2002:a05:690c:6e87:b0:8b0:cdf4:94a9 with SMTP id 00721157ae682-8b2b66da1f7mr50565537b3.16.1793593990355;
        Sun, 01 Nov 2026 20:33:10 -0800 (PST)
X-Received: by 2002:a05:690c:6e87:b0:8b0:cdf4:94a9 with SMTP id
 00721157ae682-8b2b66da1f7mr50565277b3.16.1793593989824; Sun, 01 Nov 2026
 20:33:09 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Sun, 1 Nov 2026 20:32:57 -0800
X-Gm-Features: AclHuK_ne7sIGwbtN3g2bUrDWVSMY6o8zRUq6PJsjGey8b4K4Tzi1qGEETgvuks
Message-ID: <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] BCMBCA PMB clock, reset and hardware monitoring support
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b1a5d1065f43a4a5"

--000000000000b1a5d1065f43a4a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 2:14=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> This is another of these big upfront design binding and driver hoards
> that is the consequence of adding new SoC support.
>
> My stake is to be able to boot and test a full featured Cortex-A7
> system and the BCM6846 XG6846B is one such system on my desk.
>
> It's been cooking for a while in various prototype forms.
>
> IMPLEMENTATION:
>
> The PMC contains various stuff so this needs to be a simple MFD node
> so more things can be added into it later.
>
> Inside the PMC is the PMB, the processor monitor bus. This bridges
Should have pointed this out last time.  PMB: Power Management Bus

> to several individual peripherals which are very clearly distinct
> devices on that bus.
>
> Handle the PMB with an MFD driver with clock, reset and hwmon
> providers.
>
> The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
> ports and copper WAN and has been tested on that series. The zone
> power-up sequence also passed direct CFE flash boot in the Linux 6.18
> OpenWrt port; this folded v7.3-rc1 revision still needs hardware testing.
>
> MERGE STRATEGY:
>
> Through an MFD immutable branch once everyone ACKs the subdrivers,
> it will take time I guess. All patches except the last one (DTS file)
> to be queued in MFD.
>
> The patches were authored with the assistance of an LLM.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Changes in v2:
> - Use a shared PMB regmap in all child drivers, keeping keyhole semaphore
>   handling and timeout recovery inside the MFD provider.
> - Drop PCIe reset IDs and sequences pending proper power and lane
>   configuration handling.
> - Power up the XRDP, Runner and WAN zones before the XRDP reset pulse,
>   preserving the sequence tested with direct CFE flash boot in OpenWrt.
> - Describe clock, reset and PVTMON PMB child nodes with separate
>   compatibles.
> - Move the PMB transport and accessor header under MFD and register
>   clock, reset and PVTMON MFD cells matched to their child DT nodes.
>   Select reset variants through OF match data.
> - Add PMB clock support and give PVTMON clock and reset resources.
> - Add PVTMON hwmon support for temperature and all seven voltage inputs,
>   retaining the zero-cell thermal sensor through the hwmon bridge.
> - Add a separate BCM6846 clocks and monitoring DTS patch.
> - Drop the unnecessary literal block marker from the PMC description.
> - Use the BCM6846-specific "brcm,bcm6846-pmc" compatible.
> - Expand PMC as "Power Management Controller" throughout.
> - Move the LLM assistance disclosure from trailers to the cover letter.
> - Drop the RFC prefix.
> - Link to v1: https://patch.msgid.link/20261014-xg6846b-bcmbca-xrdp-reset=
-v1-0-daf5d177e113@kernel.org
>
> ---
> Linus Walleij (7):
>       dt-bindings: mfd: Describe the BCM6846 PMC complex
>       dt-bindings: soc: Describe the BCM6846 Processor Monitor Bus
>       mfd: Add a shared BCMBCA PMC3 PMB transport
>       reset: Add BCMBCA block resets through the PMB
>       clk: bcm: Add BCMBCA PMB clocks
>       hwmon: Add Broadcom PMB PVTMON monitoring
>       ARM: dts: broadcom: Add BCM6846 PMB clocks and hardware monitoring
>
>  .../bindings/clock/brcm,bcm6846-pmb-clock.yaml     |  39 +++
>  .../bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml    |  42 +++
>  .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  |  82 +++++
>  .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     |  31 ++
>  .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         |  80 +++++
>  Documentation/hwmon/bcm_pmb_pvtmon.rst             |  53 +++
>  Documentation/hwmon/index.rst                      |   1 +
>  MAINTAINERS                                        |  16 +
>  arch/arm/boot/dts/broadcom/bcm6846.dtsi            |  47 +++
>  drivers/clk/bcm/Kconfig                            |  11 +
>  drivers/clk/bcm/Makefile                           |   1 +
>  drivers/clk/bcm/clk-bcmbca-pmb.c                   | 389 +++++++++++++++=
++++++
>  drivers/hwmon/Kconfig                              |  18 +
>  drivers/hwmon/Makefile                             |   1 +
>  drivers/hwmon/bcm_pmb_pvtmon.c                     | 232 ++++++++++++
>  drivers/mfd/Kconfig                                |  11 +
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/bcmbca_pmc3_pmb.c                      | 297 +++++++++++++++=
+
>  drivers/reset/Kconfig                              |  13 +
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/reset-bcmbca-pmb.c                   | 309 +++++++++++++++=
+
>  include/dt-bindings/clock/brcm,bcm6846-pmb.h       |  42 +++
>  include/dt-bindings/reset/brcm,bcm6846-pmb.h       |  11 +
>  include/linux/mfd/bcmbca-pmb.h                     |  11 +
>  24 files changed, 1739 insertions(+)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261013-xg6846b-bcmbca-xrdp-reset-de71b80c25a4
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

--000000000000b1a5d1065f43a4a5
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
WL73HYMBjgKbRy7APQ9J08nbtmyMYigvD9nXlR0eLHkwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMTAyMDQzMzEwWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAnd9zZ8coVwiodH/cLJ94dfhdrmwQ3hK2I5QR
0+3ToA3i2loYx6+4MXDTXPfPsMy0sDaCchL82+n3kDwRoaUzDcN1pgDZm/JD+0jgs19oRhFjvl+K
CRSq9EpK/3x2SRZkuc0uwX4mP6yILvkCt3gU//7Vrk4n0RE7ALCO7JvbmBaCZu8jjNVOwYa7klKe
EZLXEixcg1HsIOwz1+tpGk/G6NnPgQNw0tqFQO5ib2PiT44CV37H/yqpLIPUv4vMxYgfl/Gs7aog
ucS2mbcEggvMU9HSUw5kDKEbagpm6EZWoj8nCXd3nqu9AR/vtw3kSEBOP/I1lxPf4NoeLT8oNBlk
4w==
--000000000000b1a5d1065f43a4a5--
