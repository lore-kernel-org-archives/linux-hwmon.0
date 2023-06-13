Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D740EC7EE29
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Jun 2023 03:43:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjFMDn0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Jun 2023 23:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238932AbjFMDm5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Jun 2023 23:42:57 -0400
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BADE6
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jun 2023 20:42:23 -0700 (PDT)
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
        by w1.tutanota.de (Postfix) with ESMTP id 51624FBF9C6;
        Tue, 13 Jun 2023 03:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686627741;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=ZKzTXTdtfcCa4LRSqdtT+I5xFr81MDpvbJ5x4bIv1B4=;
        b=zHzpazuuoX0MuYBGc2pcjmvpPlBcCtiZ+lsNFMczAGeYY2MsmZLfiul3qhmdXfOw
        lolFydw/VAOas8jhfjh32pbMu7aP828bHTONIEhiFmBI8kHxTq7ba2MdOGw8Cj7M1OS
        JCgh8IzERnkuHD6uyHoZcfnNf7r0t4cl6YsRdkbn+z9Fd5o42DiaU1X26rcC5qM65ZH
        REewtYcKxSGpen+23WZKfYu+CWjJEON9iHuuGnCYgbTgZYSfsuvhwPVIcJr7s87xFU1
        Sc2BYMQ/YYMrtJnBsNhSyk1LV4semWde/oRvwCwqQpsIQ//L4oVd+R4wVW49X6EMCvJ
        0ZGmz7cOkQ==
Date:   Tue, 13 Jun 2023 05:42:21 +0200 (CEST)
From:   jurgenacc@tutanota.com
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Message-ID: <NXmqDz9--3-9@tutanota.com>
In-Reply-To: <NVpLTjt--3-9@tutanota.com>
References: <NUjvz8u--3-9@tutanota.com> <5704a3ac-3097-74d5-e5a7-993fcd78a1e7@roeck-us.net> <NVUpwQa--3-9@tutanota.com> <94fd7588-dd3a-4530-bfe8-a213b68dfc33@roeck-us.net> <NVoIkKr--3-9@tutanota.com> <21fd227e-337b-4d87-a84a-d1bb9bea4110@roeck-us.net> <NVpLTjt--3-9@tutanota.com>
Subject: Re: ASRock B650E Taichi support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Is there anything I can do to help getting the support for NCT6799D? Also, =
is it normal that I don't see any sensors after loading NCT6686D?

Thanks,
Jurgen.


May 19, 2023, 2:51 PM by jurgenacc@tutanota.com:

> My bad. I'm relatively new to Linux. This is the output of the "sensors" =
command:
>
> amdgpu-pci-0300
> Adapter: PCI adapter
> vddgfx:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 825.00 mV=C2=A0
> fan1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 RPM=
=C2=A0 (min =3D=C2=A0=C2=A0=C2=A0 0 RPM, max =3D 3300 RPM)
> edge:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +34.0=C2=B0C=C2=A0 =
(crit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (emerg =3D +10=
5.0=C2=B0C)
> junction:=C2=A0=C2=A0=C2=A0=C2=A0 +38.0=C2=B0C=C2=A0 (crit =3D +110.0=C2=
=B0C, hyst =3D -273.1=C2=B0C)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (emerg =3D +11=
5.0=C2=B0C)
> mem:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +38.0=C2=B0C=
=C2=A0 (crit =3D +100.0=C2=B0C, hyst =3D -273.1=C2=B0C)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (emerg =3D +10=
5.0=C2=B0C)
> PPT:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 38.00 W=C2=A0 =
(cap =3D 303.00 W)
>
> k10temp-pci-00c3
> Adapter: PCI adapter
> Tctl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +44.6=C2=B0C=C2=A0=
=C2=A0
> Tccd1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +35.8=C2=B0C=C2=A0=C2=A0
> Tccd2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +40.9=C2=B0C=C2=A0=C2=A0
>
> nvme-pci-4700
> Adapter: PCI adapter
> Composite:=C2=A0=C2=A0=C2=A0 +40.9=C2=B0C=C2=A0=C2=A0
>
> amdgpu-pci-5000
> Adapter: PCI adapter
> vddgfx:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.32 V=C2=A0=C2=A0
> vddnb:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.15 V=C2=A0=C2=A0
> edge:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +42.0=C2=B0C=C2=A0=
=C2=A0
> PPT:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 46.25 W=C2=A0=
=C2=A0
>
> iwlwifi_1-virtual-0
> Adapter: Virtual device
> temp1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +30.0=C2=B0C=C2=A0=C2=A0
>
> nvme-pci-4f00
> Adapter: PCI adapter
> Composite:=C2=A0=C2=A0=C2=A0 +36.9=C2=B0C=C2=A0 (low=C2=A0 =3D -273.1=C2=
=B0C, high =3D +81.8=C2=B0C)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (crit =3D +84.=
8=C2=B0C)
> Sensor 1:=C2=A0=C2=A0=C2=A0=C2=A0 +36.9=C2=B0C=C2=A0 (low=C2=A0 =3D -273.=
1=C2=B0C, high =3D +65261.8=C2=B0C)
> Sensor 2:=C2=A0=C2=A0=C2=A0=C2=A0 +42.9=C2=B0C=C2=A0 (low=C2=A0 =3D -273.=
1=C2=B0C, high =3D +65261.8=C2=B0C)
>
> These are the same as before, so no new sensors.
>
> Thanks,
> Jurgen.
>
>
> May 19, 2023, 1:47 PM by linux@roeck-us.net:
>
>> On Fri, May 19, 2023 at 03:59:34PM +0200, jurgenacc@tutanota.com wrote:
>>
>>> Hi,
>>>
>>> Loading the nct6683 did not give an error. However the sensors-detect g=
ives the same output "Sorry, no sensors were detected."
>>>
>> ??? The sensors-detect command and kernel drivers have no relationship
>> to each other.
>>
>> Question is if you see any sensors after loading the nct6683 driver.
>>
>> Guenter
>>
>
>

