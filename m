Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5639137F8D0;
	Wed,  1 Apr 2026 17:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775064713; cv=none; b=BwaGH1qg50r5ifc3vMEquhq5JCZVT5FVRvQa7Bf+knE+LAiQEVZlNlxLO6gt5bKmhHOb5jv47IyopRlK42qvOaisNuu0DZKbTToQ4RjWfD2h45v2BxquCJqbLfAS1dCL5DwlhAYBlpznJ+1fP4BhWwdwHb6FwByXPaflNkXXyus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775064713; c=relaxed/simple;
	bh=m9I0s9ft4nDfhWVRj1LB0c0/3LSsHsQ2zjA1eBcLwB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Irz3KSc+2Hue8N2O2ZwQUoy44wABBdsjuWYJ4Lm/blcfUCtCe2MvFRUHrfUH42L2Ml8soTG7rWz3CFkNgP3QQ0XFXTlmyDTwETZagsP6Fdy1X/PE5DQfknncaKg03qBoRQyv3maEJGTGJIKpk9SczXKvM3uZdY+4Bwc1fNlTMoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=PsdwQB0X; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="PsdwQB0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775064675; x=1775669475; i=w_armin@gmx.de;
	bh=qpw32uGV06BZQXvnXJuJp9X+WYWrxdhbfd6+uvwSfP4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PsdwQB0XY5p2gNgBwXAfnVKgSgRvrPNMKi/fBeVCsFEH3StucxzikC0fU95mMSXx
	 HruHUCwBllXLfpoFIVGpf4R88RvAy3TdYi4SQbW0RtYmztMnGk/gppPWUgrNW+LK9
	 H4bCSS0c2TLRmtdyMVPVQNjwMyTOXf5IZNAtt1fvTxQy7+MotC/Yl7+oGUBAr+BZ7
	 Rw/csR1ZPOtXGwrWnUZW9v0xj73N2U17aBXPGCVkBtFj479BdrJnX5ALcmebBr/in
	 oaNbGHCnIvH/9FeY1AtQO1OZjeRpuq3fwy68hiTdknaxQPjFH27owa9VWsOId3Dca
	 ectjxXmy83Fnc/jufA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGN2-1vplVE2oVC-00LO6S; Wed, 01
 Apr 2026 19:31:14 +0200
Message-ID: <32852e92-468e-401d-bd4c-390f69793b6b@gmx.de>
Date: Wed, 1 Apr 2026 19:31:10 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] platform/x86: dell-descriptor: Use new
 buffer-based WMI API
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org,
 soyer@irl.hu, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
References: <20260314175249.16040-1-W_Armin@gmx.de>
 <20260314175249.16040-2-W_Armin@gmx.de>
 <658006e6-bbfe-03b4-f788-8f041adda03d@linux.intel.com>
 <44633ad0-2b80-40db-9655-e0eddb3fa02a@gmx.de>
 <2446bca3-d524-bb17-11a6-e03bda3d5c6a@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2446bca3-d524-bb17-11a6-e03bda3d5c6a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m9ijm0+eS1jLgunmJxTnM7VyzgLuFANozln1gupljOhsIiCVHxk
 UH3FyyCBBf/C1z45j+dzEe99xGMEm//6th59F6yO2F/v8tGIVpu5pfgTkXL477bd4bLYUGI
 TOQpCF8615jyFNaf3ff3ILSmYZFGZj2V5f6n2P/dO2hrbDUE8dPFn5gEpxc8vklDvn4D8ij
 lpCyX/7BmYSegStK6p/1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NZyvfq1jFXA=;t5G33IQ/pEv9l+F9TiewFaOMplC
 DBWRYLE9yJh42ZZAYYp5Jf+aQ0R8INckT3J+iJqjPnUY2UYGKv15dhk/FwkDYxcnY+1oov6cn
 u4H6VPuFDkHao/DIt8sVgWDXhugMiHlU4aR2331CRygGNyjBT7rMV4sf6tZGCSw0D2t0ay8Ww
 yDm6SZtSpJruPTJ6qg8GD3UbJvbK+HXraVNXx6dCl9AEJ2WtCfWr9GoVictm48mjLyDe4M0UH
 POvfs+yAT/0KuZu/vsNBAk4DeJwEt3SNYR7CWbyYmSLnAFkfuMUOWT0D4MZ7NiZZZOHTxDeHy
 KOWTmCnKPLMpPvv8wp6Q5D0ck4kZJo8bX0eOn94ZSo7L/GTFdu14Ksq3+QVipnOYG14j6zqG3
 RWpRZD1wHJbMjK4OB0CiMbc2ioA3cliimdwU5L4fK0UHjPoYE69Mf/+/3Z91TZ/Q/Qh26InrV
 pN9rlP2itOQ4r22myQy9+dzWZ9i8NUVLgMFPOqrvtF3Rl8+xVRaf0gg2cOo0FL1U9C0k3+8nm
 j3h0ZLFOdLdu1Gyz0njN9zrzY4NwOQUbX30iXZuHG3o8eN5lJYwC8mHXO50wDGnUurBLPZlMR
 wVWwT9TN8xlgSf2dGubx9hlw8HqUfCw2cTH+mArQ5eXYcVy+Kn/t1t2Y0rgDpWSZZp6Rd987/
 ZA7I6g0OlNK7pdbTq3eXSux8S6sfDSWQQeop50Y2K/3jycxxuEMX2woLw5XhVEBvttqv6j9XV
 pbhnSYegQOlrYnqhC7AkI14kXU92Yr9X9fNe65yfdKtcGyF13G0SY2RGVIvKsKiu1Q4eKrLxN
 F2rH9/5o2YPlbdH5OOnUI51Umsb2gglgS273kX1J9mSgIvHCDqzj+iknN0JrnyWLmQFzVehI9
 Qa47fE+Gfiw2IV1Cru3qGaW+hct9jI4Xef0BILxaZW61ajCgoDTNK3qD8sIZw2EEp6V3TPZP2
 uVyPdlI9TkOWihUsIiaQbP0cM58y5BWES4/CDVv7aSWeC9c/z2wQIbW3PThDDOE491RHu7Hol
 A9haHrV2WRxtwFxQfUkvZODWemOswJcR7hFgFrDCf7OdDYV35htFjS5O41DjsNwsyVaKxMvYE
 yM1tv3+jHot6OotLTtJGIH8UhYPfCjXcNfZuyQMHZiYCbSbHryfC8RElFTvdt6ZDMp677pB/V
 6l0Sc6IKCCpj/SJXMvzIGXNP1a6HFJzDRb9tVUF6E5a1ne1pq3IK4fyKhUPoAjmUy6f92cVo8
 6dhtltI3zQGCD2GrwF3aIoRYzhmBfGiuEecAfxqBz0YLiIb5jHD7q7ERTeCUMyASVg1mDH6b2
 seiURX4UFyBXLrbiiKDHTp6GODt5qj5OAGv4L9E/eEKo1rceEWKx9H1hNNcyhKtlyl09LiQQt
 zytXImlvw/vgTQu6mS4cbNx1aplFpS+GN+2KXEjBFpCS9QL0PlEKeEqfXoo29J+UnY/pvPJ3K
 zTkL4w9EnMKRh2PAxchiF9p3uuJDUQ2tqwH9v7QLDcZVmfvBj9n3v+AKslgg0lutt9CQNnFjY
 n6Ans0vtfKhX71zQ1+uox8Vx5d318LiS1CBFBt1TGGOagzO+Svjy/HtGPMgoHVwnI/bXpR1pO
 8y4ec+qVJZGnt4clblaN6upr0HgS8asa0zQ5rOUaFCod6gMBqzlOfDaXKPZ/63+WXZzagN+C6
 yCKRrNYDP7PsL4mA5ye1fv25W7D6V3F/1i5eFDVXC4XqpfYqRMAbSUp3nIQkX0hp7j5W8i7LZ
 c/YuGWJGRJTDNaBdihhve/QrTCsLHXmPBDOWXfXPqAoe18fcPi6CqYQ0URzicVERum5CZ3z/9
 kJu8082Ppy1gLKisRXiWPgSyir52Iy+0dQpjzLlLEY7TPSVRyovusG5hkpI99g90MSjQpRP0f
 Vhv5/9wWh1JTlo0dw5r9z0W+4uEDMKoXn7V2MFnITJzt7DKS+PEbIOugwO2tn2NUvFzucrknT
 Fg809uxCc15hyz4J6j7mMlRvnKUYNYXNJIHyb4+/u++qUpnL1nasDuOWd9pA0xBlwX6CPwwXo
 HfsF2RqJJqeYaKsLo582YNGshos9A/BQKNJqaaQ/BFXxLpTg3nGAnVTbhH2kBwOuFc851K5S6
 oE1knjKy/GYFFyhfqUTTYJrnC9E8MpfcTBfoz6fm9zr/A2Fkx69fPV30SQmB0v+DOz3M3vpZ2
 jwRKtKsqk6hAwm5mZwUw/31qLND1sHy5QYMeFfHabYY1ERlh35owCxuBPmoAoiZ/KTaw7Uzdy
 1a9Pm93vHXuD4q5v/+4vk7XImb2qZjbSYZI/UYufKRWPEJ/l/BL6Y0KRO6CT0y8wQlp4oYZYP
 irHpn/bQz2lbfQTF1iJNo+2/xMZD2KsCaczXw9xcw3eJNFoyvPLAinrsG9vMXSTm/Rh/XR8/C
 rqwz1yAxLVLdUn/ePS/liEdsC+z2J37uVCKdPQGW+lXAZUwBiq4NN9tYZN1CrdNsLRCLctPrZ
 0t83dtX04WYiP/9RJG9OqpVefPbd7H+6fxD5HDxgyS020Xd2yX7ndro1X4XSfDMEWNjezeJlT
 3o8PeSijnxIH+V8Ap94q/6B7K+/Anb6pPmnTogbHXKsSQ2umlV/vhWM7b4CCKZTJOWB/O7CWR
 7emgYwEQSqFIW26sdI7YkQYF4rtefQcw6ul4Rif2LdpV/BEz113rpKWdXe53lLrYhWPqfebR6
 sxWFYI7nVS1ar2qYTYDcJk13P8xica5917YeGQkwf0fflhXYAeP6MHwaLT3vHI7QlSze0g9os
 kjStYfQ30Fr0rff1t/8CQULVDGYvyo2m4wdmSB8lYSxjRzh/Isw8eyuEZD4urBemL1xvS8wkc
 3di/UmJMlysedi0ANNY4cZ2sF3DFfE8x0mCLLeAwdtnrCuJu8J06+fECKHLNyyLyM/EccUzUo
 KGn2/DN5IOz8wHsLqS1z11HYzDE2j+9WOTxbfqaYU0qNyVVNX1TkemzZk6lqNybqIcsDQjl44
 9Rl8oVnF2xIgaHr24tLXJARE+KVAYBMZ/Xsq83UyCyCtUfwvvcKl3H+1Wdxc4A6yC52fSsJZz
 NCJBsO6WqSVoa9+Vb6E70V9QMbtnLDrJkAvvYfZrQlat1gAmoGkrkwqBsHyAQs0vcUjuoByRC
 x50MOVFMQUYe8rJ7eVWzqPJXUua0m7fo5CbGbpwNhl7e/lPJWnBk7BVF7cqMBbMi2SkgTJapw
 RHdEmLdU9bHquwC3wEOZZQye0x9rDDjKBhA4slVX55PMJre8+rrlvvP48AsVDljYf3lEzwZUE
 vql4tudnY9GjD4J6/LVla06iFdbon7ZsnfSpXsBO2IEwoJ9L1a3+guYobDyqMxcSr0luo1Jua
 u1OCE558qX2ELvos9cFhyxsBWiCtuQKV63jCo0xfNQ3/Y+GCyTcHrF+5F0ayOTJtwUDEzU5qX
 ujCdmPxbvLridf49Pn4boaaSjaIbUFm3dczOKk94Ztu63YzhZ3XxYNrF+n1aedO6o4ELDN5JJ
 m3Z1rFE0UM8mVLdY+3xll3lr2LjoNK9YXJDVeI1eb5y1AKiWI6GJeWakyI5br2pxI7wEMWrpr
 t8H9CacuMrR4nxXgy8Eu9pRqxcYXLFSu4ceWOx/865sn/8RULK9btXhe5mgJPasJXbRyHcM6p
 IPjQIeP53kf5zJpXOpZiZNObZvY97N2pmjNRXiCFs4r7oQra7TWFEw61sMNkiDXSTVpjX444x
 YHItjiNGlLPJ7K5I6+F3Zz0zUDw8AzVYrxUn15zrBIqs8vEaMnaQTwZUKGU7kvD9eGbGcKpBU
 pnLhUdm06ftUPpD4qK1JBGEoviOkqOBxlrdWROzLaSW6M8rq4xWxFru3YXy7skEvNqYW2U1wv
 bK9Rgd1dHBzv3DaAgc0JVHWQ2AQpzRjar1T8adojUmW7kCt6b8hceQWWXOVAus+nBtvytzBk8
 hh7b5nqeTKUVn/v88lds0J0qGIVw3UcLDNBc5LDNJYdORPj7OuCWdgJbTKt7WZZLHndNQs46j
 YyvM1VSS1LQ+I+Z/pAJyhe2cp+Ak/OHbYVq2tRaxheZboRxcvaiVky0jqq21mI1YTMunT10ue
 WlXFgFdnvexrO5xse9cVFEoCoiAhQrsWYrM19z7pHJ7ZMcTroDSnqTs9RrxSDf8MpN7oyPxj5
 eOIvBqlhBr4yKTp8oKW6enVZJnU6SbdKO1ffSqhdljwjbGSzNzi84o6396u4KAxmmg/0da2dX
 PflA55y7LTTeEaNidNgzCYZ+CZ1pzZzUKpFAy41x9xzIIvJtNSIynBHF8liyKUj/Obz/XiZWn
 0CgDROCfiUjZWdGO2OgCM5+Cuuwr0IjpaoyIoYDoBcRhxrYLXwSqDQ9kqz1hhHLXG3K/t9zjS
 TSYvLpwrMTwhEhL0z2osbViKht7lWL5qHkFeXNy4dRZQoBlubh36snj+UGU/yRUQrKKit4MTG
 HF+vsUx+ZJGxaoLr11pKTOblCLv/vY+c1u6CBtPfAdrg4fjmhR0/thqc5PXjSzqonq7BAEFUX
 yCkY6O6CwkHqrmd5ZRd5ArXClpQ26qDcB66s1SedN47SzaAdpC/8qT1LMM/AxqK68aJhPPe5G
 5pX6D3EljVzj8hh1v2lE3E+Ef9fnBGDFOSwr0Gcy1qdgUl+cr3kI8f91NUyePW3aMGbCRIJTE
 Ocb7/OBjQdyv2YgfYTAKiMDnxxjIvG1nMzxAVn72Ha131EMpV+5CqrAUurHPMiZ+v3rBh8jZ7
 3iWdzAej3ZU1aV3g0RSFyeW5cU7cBXKEBZrjP+btmppAVnFBNrGsW+npi3859VrSnV7NbCZM2
 0W5fZYtyzYnlJf2AZf1DOPn0rUUAZruprWlWnBKHlcs81twPwUZOq5LLWAoH46udKIoLWtJn+
 949aAtnRY4iVAiOOep4A4d0OmSph/n0+Le2Mg1YHpou+qiE/Okly6Vezt1jl4xtNupy2gDxFt
 3GJ4cPCQGGyPpWGj2zvlCFffcea/+y1jp6hLh1dNvtsYLE6NsQOkH/+vupkzAzUKgr/c8Du70
 J2431XSBGYh35LoCVBKqldSMAw8Y6aH0DZVcTxhjrtOlG4JHV/radT0Dsz3V2hfA6pdMwrEKY
 wkL2bWdFI8WdJG1Ml0Z+RidKZCWVe3yGaoZ4csy43obY4nvuI+e3Z/euXSxCOHvcZQqAZh/8Q
 dg2m2p/eNq3vhXNsqsCkdAHzlDx51OwC6A+ZD5fTD+DHFZ64N4O2tbgjg0itbLgnXWJ9vbOci
 /Mutr2zHQm0Ec+uiDvmt55c4oX7FvUz2EOQPrpLJ5sn0q70RPaE3raI7humFYUE3ZdMtLPnVY
 qqUch3gmphLcLXHDncDHA4WugPhUMem3dE9lFDrnRoHACWKM3eF/Mt9fV9IyozrZ5vuDrLPS+
 +XcxAltbwRMP7ATnMb8L/1YolEb6EYPahbrN8P1/fdJng5GSsT9dd5L//BMRo8uoKadTXDzri
 GLpBdL8I0APjeu/+cPjr7ELrfnj33R2M9uxAVyYASVoY4=

Am 01.04.26 um 12:06 schrieb Ilpo J=C3=A4rvinen:

> On Tue, 31 Mar 2026, Armin Wolf wrote:
>
>> Am 31.03.26 um 11:44 schrieb Ilpo J=C3=A4rvinen:
>>
>>> On Sat, 14 Mar 2026, Armin Wolf wrote:
>>>
>>>> Use the new buffer-based WMI API to also support ACPI firmware
>>>> implementations that do not use ACPI buffers for the descriptor.
>>>>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>>    .../platform/x86/dell/dell-wmi-descriptor.c   | 94 +++++++++------=
=2D---
>>>>    1 file changed, 47 insertions(+), 47 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c
>>>> b/drivers/platform/x86/dell/dell-wmi-descriptor.c
>>>> index c2a180202719..fe42eb8bbd79 100644
>>>> --- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
>>>> +++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
>>>> @@ -7,7 +7,7 @@
>>>>      #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>>>    -#include <linux/acpi.h>
>>>> +#include <linux/compiler_attributes.h>
>>>>    #include <linux/list.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/wmi.h>
>>>> @@ -15,6 +15,24 @@
>>>>      #define DELL_WMI_DESCRIPTOR_GUID
>>>> "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
>>>>    +/*
>>>> + * Descriptor buffer is 128 byte long and contains:
>>>> + *
>>>> + *       Name             Offset  Length  Value
>>>> + * Vendor Signature          0       4    "DELL"
>>>> + * Object Signature          4       4    " WMI"
>>>> + * WMI Interface Version     8       4    <version>
>>>> + * WMI buffer length        12       4    <length>
>>>> + * WMI hotfix number        16       4    <hotfix>
>>>> + */
>>>> +struct descriptor {
>>>> +	char vendor_signature[4];
>>>> +	char object_signature[4];
>>>> +	__le32 interface_version;
>>>> +	__le32 buffer_length;
>>>> +	__le32 hotfix_number;
>>>> +} __packed;
>>>> +
>>>>    struct descriptor_priv {
>>>>    	struct list_head list;
>>>>    	u32 interface_version;
>>>> @@ -88,76 +106,58 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(dell_wmi_get_hotfix);
>>>>    -/*
>>>> - * Descriptor buffer is 128 byte long and contains:
>>>> - *
>>>> - *       Name             Offset  Length  Value
>>>> - * Vendor Signature          0       4    "DELL"
>>>> - * Object Signature          4       4    " WMI"
>>>> - * WMI Interface Version     8       4    <version>
>>>> - * WMI buffer length        12       4    <length>
>>>> - * WMI hotfix number        16       4    <hotfix>
>>>> - */
>>>> -static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
>>>> -				     const void *context)
>>>> +static int dell_wmi_descriptor_probe(struct wmi_device *wdev, const =
void
>>>> *context)
>>>>    {
>>>> -	union acpi_object *obj =3D NULL;
>>>>    	struct descriptor_priv *priv;
>>>> -	u32 *buffer;
>>>> +	struct wmi_buffer buffer;
>>>> +	struct descriptor *desc;
>>>>    	int ret;
>>>>    -	obj =3D wmidev_block_query(wdev, 0);
>>>> -	if (!obj) {
>>>> -		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
>>>> -		ret =3D -EIO;
>>>> -		goto out;
>>>> -	}
>>>> +	ret =3D wmidev_query_block(wdev, 0, &buffer);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>>    -	if (obj->type !=3D ACPI_TYPE_BUFFER) {
>>>> -		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
>>>> +	if (buffer.length < sizeof(*desc)) {
>>> Hi again,
>>>
>>> Thinking some more of this...
>>>
>>> Since many of these drivers will need to do this size check and assign
>>> into some variable that is different from the one passed to
>>> wmidev_query_block(), would it make sense to move those into generic c=
ode?
>>> It probably requires a macro so you'd have access to type information.
>> You mean something like wmidev_block_query_sized(wdev, instance, size)?
> So this would return ERR_PTR() as I see no out param given to it?

My mistake, i meant something like wmidev_block_query_sized(wdev, instance=
, buffer, size).
This has the same purpose as acpi_evaluate_object_typed(), where the error=
 handling can
often be simplified.

>
>> Personally i see little benefit in having the assignment handled by a m=
acro.
> I was not so interested in assignment itself but getting the size
> information from the output type directly but if you prefer writing
> sizeof(*xx), not a big deal to me.

I would prefer writing sizeof(*var). I will resend this series with the ne=
w *_sized()
WMI helper functions and the __free()-related changes.

Thanks,
Armin Wolf

