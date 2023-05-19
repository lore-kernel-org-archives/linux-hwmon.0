Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96ED6C77B7A
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 May 2023 18:51:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjESSv3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 May 2023 14:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbjESSv2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 May 2023 14:51:28 -0400
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9304171B
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 11:51:07 -0700 (PDT)
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
        by w1.tutanota.de (Postfix) with ESMTP id F1CD5FBFB85;
        Fri, 19 May 2023 18:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684522265;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=WM6lHJJtCBFS4UnNSmH0m9P+i7ZLlgG5q/AoL8rMp4w=;
        b=NRriqdwG/Z98j5Ukkj35nsS217i/vtHBEWpSMCIak3oOkPMTl/YWflCyShSxkxj0
        HGzaprcw/J64LnNjW/vjmm61OnO8AvzKX7Vob4K6DDTeS+EHDu5uE/dGtyioorTP213
        vvjbqyDNWY1yiyc8HcBs6LhrTd6aRSuGZltFFDuI5aUTl5LNNUM1SFEOvzRoDhtB3fL
        qjj6s+T8Qe8UtbtCO4WEX8qixpZJzZqKDXGDHCR5ggcIEKUJpx6dx8BpZjwHGtS8J3R
        M8ff/4qgIkvxLr55/wG4HHKt+UstKtBl5bgL6iXZhvGqtgtHUZCKt7WCPQrFht4BYfw
        4qZ1UsPbLQ==
Date:   Fri, 19 May 2023 20:51:05 +0200 (CEST)
From:   jurgenacc@tutanota.com
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Message-ID: <NVpLTjt--3-9@tutanota.com>
In-Reply-To: <21fd227e-337b-4d87-a84a-d1bb9bea4110@roeck-us.net>
References: <NUjvz8u--3-9@tutanota.com> <5704a3ac-3097-74d5-e5a7-993fcd78a1e7@roeck-us.net> <NVUpwQa--3-9@tutanota.com> <94fd7588-dd3a-4530-bfe8-a213b68dfc33@roeck-us.net> <NVoIkKr--3-9@tutanota.com> <21fd227e-337b-4d87-a84a-d1bb9bea4110@roeck-us.net>
Subject: Re: ASRock B650E Taichi support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

My bad. I'm relatively new to Linux. This is the output of the "sensors" co=
mmand:

amdgpu-pci-0300
Adapter: PCI adapter
vddgfx:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 825.00 mV=C2=A0
fan1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 RPM=C2=
=A0 (min =3D=C2=A0=C2=A0=C2=A0 0 RPM, max =3D 3300 RPM)
edge:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +34.0=C2=B0C=C2=A0 (c=
rit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (emerg =3D +105.0=
=C2=B0C)
junction:=C2=A0=C2=A0=C2=A0=C2=A0 +38.0=C2=B0C=C2=A0 (crit =3D +110.0=C2=B0=
C, hyst =3D -273.1=C2=B0C)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (emerg =3D +115.0=
=C2=B0C)
mem:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +38.0=C2=B0C=C2=
=A0 (crit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (emerg =3D +105.0=
=C2=B0C)
PPT:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38.00 W=C2=A0 (c=
ap =3D 303.00 W)

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +44.6=C2=B0C=C2=A0=C2=
=A0
Tccd1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +35.8=C2=B0C=C2=A0=C2=A0
Tccd2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +40.9=C2=B0C=C2=A0=C2=A0

nvme-pci-4700
Adapter: PCI adapter
Composite:=C2=A0=C2=A0=C2=A0 +40.9=C2=B0C=C2=A0=C2=A0

amdgpu-pci-5000
Adapter: PCI adapter
vddgfx:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.32 V=C2=A0=C2=A0
vddnb:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.15 V=C2=A0=C2=A0
edge:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +42.0=C2=B0C=C2=A0=C2=
=A0
PPT:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46.25 W=C2=A0=C2=
=A0

iwlwifi_1-virtual-0
Adapter: Virtual device
temp1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +30.0=C2=B0C=C2=A0=C2=A0

nvme-pci-4f00
Adapter: PCI adapter
Composite:=C2=A0=C2=A0=C2=A0 +36.9=C2=B0C=C2=A0 (low=C2=A0 =3D -273.1=C2=B0=
C, high =3D +81.8=C2=B0C)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (crit =3D +84.8=
=C2=B0C)
Sensor 1:=C2=A0=C2=A0=C2=A0=C2=A0 +36.9=C2=B0C=C2=A0 (low=C2=A0 =3D -273.1=
=C2=B0C, high =3D +65261.8=C2=B0C)
Sensor 2:=C2=A0=C2=A0=C2=A0=C2=A0 +42.9=C2=B0C=C2=A0 (low=C2=A0 =3D -273.1=
=C2=B0C, high =3D +65261.8=C2=B0C)

These are the same as before, so no new sensors.

Thanks,
Jurgen.


May 19, 2023, 1:47 PM by linux@roeck-us.net:

> On Fri, May 19, 2023 at 03:59:34PM +0200, jurgenacc@tutanota.com wrote:
>
>> Hi,
>>
>> Loading the nct6683 did not give an error. However the sensors-detect gi=
ves the same output "Sorry, no sensors were detected."
>>
> ??? The sensors-detect command and kernel drivers have no relationship
> to each other.
>
> Question is if you see any sensors after loading the nct6683 driver.
>
> Guenter
>

