Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E24E3559C6;
	Tue, 18 Nov 2025 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474812; cv=none; b=tHEY6gFjwyj6EmMKeo7pv2kDBz1qNZWHx9al3U4weQBIK4Hjbr/Em8slAZ5oMiYuyzaA8JAbVDhVjXb4+aEyJTPZNzNlnlOogjPcdBtoVTkHaBRwncV4rdxmxa0aO7zE7pWVZ3VckXzbLy9k0y63aJIZXjadHPpKEgZPUJn/LNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474812; c=relaxed/simple;
	bh=4znXK4wTx2JU1LW5XKqcIlv9glnDLDcmMZBFWTJTkQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+rqTNrhxmFUNrDYOY7MfB8eF8Wv2duEow8lIO5egb6rd+2thDbDBK0LKpsp5JvC3GRijIGGstrFKleojb4orZVsiMYVHCQW/elDtGCsUZywHujE5cSNY0l9wvcgkU7DNkXOIg5pHb4c/wqXLZa3iVCAdVl1Lm33jGBIzIECQ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=VUxWlKMT; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="VUxWlKMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763474788; x=1764079588; i=w_armin@gmx.de;
	bh=bCWcWyjrMr9/dsF/FyBDWmRkUO8dEa97RIIKknmrt5o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VUxWlKMTuJj9h0USBLC4V2ZAL5/QsVbTPayuSlK6xnD6zk8+5gNmugB4RAE2jWGI
	 QsRh4gbcPHqDJ3yYfbOWNOEDEM/6D+tJGlbReaDmp6XjQOd0Kqo6i9iS5heGu3khN
	 xgYm6rwL6ksK8UR9sjd91N1Wc87/6AEvYmhSuU16751pP5hfIYyv8NjcefF5KdcrY
	 gqQDZwl1KYWJoNK/7ljZhlkHcVtB5AYoTfosoxEpXfnUnuT4Eixzw4sBv8ExwFy46
	 7z8uFdJyfNRsq2T7vLrPbqUNZfwZMVAySqPJ9xNE7Z/Hr0xe5bDirjcXMMa/5pxu6
	 bOSRMiXnJe4IUbu28Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.178]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUosN-1vlvbp0O49-00KVQa; Tue, 18
 Nov 2025 15:06:28 +0100
Message-ID: <0daff739-f8a7-4042-af6d-e7dbe5aa6720@gmx.de>
Date: Tue, 18 Nov 2025 15:06:23 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] platform/x86: ayaneo-ec: Add controller power and
 modules attributes
To: Antheas Kapenekakis <lkml@antheas.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
References: <20251113212221.456875-1-lkml@antheas.dev>
 <20251113212221.456875-5-lkml@antheas.dev>
 <77b944ff-2f84-3326-3901-5942739d3c43@linux.intel.com>
 <CAGwozwGq7RiZdpBsYhKxfrTMMfzGPGML2R6q8ayjpVn_W4j=uQ@mail.gmail.com>
 <f66159f7-2811-c093-4871-5a7153398e79@linux.intel.com>
 <CAGwozwHPeWEk+MGjf39obC9dCNfpkk=zcr6--gux1fDjeZGu-A@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAGwozwHPeWEk+MGjf39obC9dCNfpkk=zcr6--gux1fDjeZGu-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SfxIqi8r07YvfTKOmFujSx31glQLJSrX/C5u7aUcdIfhWFvSHP0
 Z6V1UEMRUHojLX9c98GWYN9/1wUoYAgemPf73iPwUJiui0y6+/mJKB5SLvEWCtx90cNNyud
 NBasAs7QI4GsYSCwD4mvY0o/MgyKNwcwFsRGzTO+/kubecGbN22GWvkryDopv9KPmp+9qud
 hwS9mJYyLIFwcLMgizKrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YDvyIgsB538=;eDXek/95NCQIFKT/sCBB3dki+fp
 bq3QRHZX3u+r90EdhSBgFzguftzqv5kI6OHiCTgYhd1zAqab4/FJYxo47a/EtKgZAnmkAjXCB
 +gJqazhWiuKUUA1sPbm8iMFXNW6/wwxz/JWNyz3/NhEaLs9IYmYkKZKwWrhaLQ3Y+tOu6DXQZ
 3ej3ZkDy20BGRe3Bzc3WN1LHr72ANd2m8Sf6ealccQxNRlwJlOYAhzefGsSwnXFhTm/kESYPx
 jNSdida7CJjEREP9cjVFp1bRY3Ge539Nu/4qwn8KUW+04FCuB8BX1Uc/WD6JcWuAg3t8TWdfB
 6dg3pyVJ+sgkaY0zGxbipuxoJ3lnL6brTEm1W2leXNtu7jHrlzSKTs4YyJn1ToDvRDuddUmnU
 yocNpTb0T9cb656SkM6DV7uvMQeLUT+lR8xM5H699/VPoUgQhFLiY4tw2i142uWCnKQCZKFyE
 8NfX3ruIr/mvHJLDfrPFhBogFuf3aFccJDKKzS/z24A+fCipyUyz4TTeER1WZvtCRpn7E4yrq
 y6KKRnvhbWinOS7zbNQHM8Ib3rPlEk1eofO3jhyFg870Lbu/qRzTlnX69k0fjppnfSugGPQ43
 w0HmssYRL7cJWgtf95XHcUavRYS84XQeSlLQgPSHPOM0whx+G3kEk18zSK2LBKp14QR6tz7MU
 skqf+SD0cErtEN5MonMQnehtIt1uKxchY2FZ4O6jolRSdy1eGuecCihlpbAK9Ow5MEUCtPYy4
 9fb4+Zvk5w2kqb5A7gP95V6j85QK+R4hCfC4jwj7kMeoij77zOibQa06fI2NC9RQqbOZN65+/
 AVgpbAGUsUY2i9Vvxf6MlCWxpeo67lxDhLVNi0jG9tCyJxKcfl1jqfCZvqcCnskIoiOJO0AFT
 X4A/NRUAQ7chIRJ4i1Wmd8XiMe1/xjHlervA0VTPzuDeJNf0vKOXHow1Rsdh1naphwg4Prdqf
 eX967ppwpkq93o/QNCm9i4vr4caWN5H/hcAveH8wE4T9y5NnpPKsk+YAkTjMbBn8AKa7zL2OA
 OqSGBbp1IAorGoiyxaH+3YVH03rbSycRICfYEZczzhTFA9/e7nS46widmIpz8ZH2+3sBM1LIR
 GXgIj6gXqhx6s0x6FJONXlSA2SvT/Q4I7lJ7GujnRU0grGQOTOJ5dn/eO0XR1jU/LB+WY9j8Y
 9y2dHwEAyuHa+LpVdBonzoAg4QPfxyfZkvZSycA/H6MwpuSNeeEPFeuGQdM0kfzCyKIcNbMyn
 kO3pbutDTrcVfCcIJGZr+WVNSjgUez1dK48gQjLgeXrwqj2+Uyu3P1tyIeZzmZ6H1GN3lKdFw
 t9DHBUa0orgA3ud/Wp3+CUKkFjhbmJX97FWFrT0tIo6io1nuMMCCA/OIRDB3S6id35R4LmYoU
 WReizbdg6u2gnFNuukKD1C2G8MmWoe83EmpWaBWamB6AVRRW02w1kBmGvv2idzeDlFXkH0jCb
 zxInlWRpiQ4TDnI8J9aXxAprVMXK6/qAld35r/zKyy6tVHNgZ7i46UunsAMvczltg6M4iAFxI
 9PkUgFL/CiqGgXe9j/uSdQ37TKxRaRaLTUKu9AY8g+/k0PN6b6m4t8ITEINpSGcjEtd8PKJVu
 Te96m0uZIKIs8BXMe/4GlpZWxRuL9oGtMKz0uXYGaD/PBmuwQH4wrHhNKby6BByVuXC1SDDhM
 YAEyeggj4l/5jAEPgbTMgv9Dl+NxB+ONUdH14HZcn2tllkCe/nhf86CkngXxz0M1Qb5pxlPEc
 f70Oln9QSVOV/Wyp6PMr/bXbf2PksmvSenuHOjvS10nWcQeVwY2JidQ2W0l4XjSXDZNoRp2AE
 iedxzeINfJqQqKzKUT9XCcA6ZhT7SgTvG6fkZuVrGSZJ98C9dBw+4bSXjWijjuG+kna63AIEG
 hB9NVgd+y/aA1bZzocL/5neG2R8WliVI+t6PxHtqvo9Cb8Eg1aJUydz8RKmYt31L67aMlP6iV
 3PionLV3VWXuzRDKOu3cnDVvaBvhV0PG0tB71xhmWVukP4AlK8r/c6bkIIvYcu9iWP2GdI6Xc
 ISoqUQKZufdJCg2fcUo6Y5F9c32/zfKS0clHfK/2dfYfve/Noi61xQReeZbDbLgqQSwaoketS
 XelBBLGj19VTdYF4prlYfYgewzPcQj6NlWmDqZ2fn9as/EzHy0Y6O0LkOaRejswaznKnYTGCN
 UdxoQVMSCkjJPEEsBl2WtRG9uIaH4jtiBN9LXAfk9xumEEUVcJEf4c2wnzImc/8G1Bu+x1R5p
 V004Qr+DXT6anEVOjzJH1AuHBS/BCsQC2KxzQcfnDkY56bzfQLx4cHhqGyTRBIM3F17cxUoE0
 6w8UPqDpdf6zTrne03LtH0813fc0OULW75ugQkb0Gai97Ujn5B99N0nmf2shDsfNEu4kz4fSX
 7oohjgsKCpus6Ru3pm6wWPKS/Z3y7pZR+GRTk5Ad0audhLIOWcYp9tLcwP/UubmxwGYPPW5ZL
 4MePxvl3CLvEM9+N9YRLCdLjAru5drp0RdOg+DE+16tImdJa7oHCWbkcSRPChdHDNdw6gUMIx
 iTQXXNPhXMX9Ujlvbx/bTd53+xDPQT42a6tmAPEg8dBLi884npe7svhaz5u5a6CeIDPnbivxn
 nMixylWU6IVzq4qCSxM8kFDvEtisGdKMAA3HfcM3YCQonAFH5+ns4tzEb9BpunwUDG/OG/sgt
 GLZgA0ImaWATynW7BjWlDunCWY9XgNmoPnRK+rUzMraewwXdkGfB62mfnzLzylaea4L2ghmXa
 1J9bd62CrZQYV59nqpPW3n3qcLeHUeVJFrHak07M+AjaL99cuYEl46ULMN9rooKKHj0ideDyL
 SZr4LGTwtOyqShpHrJEQRP7dqsWhDGSb2Zxt1Iu6Blj9M+EXtwD+xoBiu+AIAxSpgzo4Bgv6p
 HNNIqWrvp98r+pSt4fDono1er/dxMIvrckJ3SqilyaOncLd4TVS/+NqVhSzBDbgrOwqmuACwF
 Ptti8KXTnqmNVRCiDBfk63a3Y3JhKsAa8UA3ZIO2w3q5HWJmzPEVNBgFT5m1GoG7Ttqu287VT
 yVmA8X2+wMcpBunrWza/dPAJS5B2n5MU/Eyza96StbguhE/ISdi8OcX3S/lIPKJmXltX1lVv+
 ztAWcGlg5gOM7kidQBX0fZYdK7L+Xf0jxQgb0vAbpPP8on1mIkXtEgb9xpwlKLa+8tMZyGU91
 I6JQb8tlnD4uw1qfjxxVQOObREV/Wt9qQY08TH1brLW4WOmu4ak98qpUDrQKQUrbpZFA+d0aX
 cgkBl1d4aki0XG1UDFoH0CZ4vIDQDTHojfXC2JPThnQpeTDgiOIyFIGfgShf87dXJs+SNVb6R
 sZzmJMKx9fSxM6wPaC7ras2OWkeFkg0dPPqPwXwZg3WcjmbKyxvQrZ67iU5GCWP1Rj+qUh1Bp
 KCb79OtQ8puqZuT9xjjTUeNsPNfjqf5qOxt9rhcWFl6nf+Glo9JIcFvC/ZbQI9ndxfxsu2SK2
 SpbyX0r1oJvwjgCvV2gOsCuVKouMG9DJgYPEeOE8t2zSFrcosgCSEhfOGlCa4LqbWGJ33b3T0
 2cE/ATHjtREFRi/qBwyaCWrk96Z00VN/2xYj3yWtMRUJo/YPnPb7OqLCm3H9nIXljUYh6wAOY
 7WRY6tze49c6Y86g05DER3b18BjIi2s/aoiclX4/gOmwvKFB1DKV9raWrfcUpZyNwa5unsoKz
 pNIYB2d5eQ6cA+9n3a39+KxI7ueaYGq0bCMCsS7Bgr/1vcI6mdh4hFFdzRcOLS8pHqqhGkgqZ
 hcrTDRxytfBe4I+akvjzo/K9tjo8S2d9zYRqzn9fxAU+UBHlT1MKK7gwco8Q1isjlGozmnbaP
 4XF4ORYvsfYtsR/cnY25NUheL4VHjvWjzU/OECIs5lfu9jI6MbCtowXJqIT07AFZVfwrBt/2x
 nszHr6YppnU4m0g+NpWHkHuqs5ADpSTk/zay4jHRsvwwxLh7NEkleLK3K84I2n99vmyOrSoAa
 O9D6GmcC+EJ23Mgu7YiHML2ZrQQxrXbIy5B/yp1ed/4O8FBBV9/mYky+2tBCLQOXFqo+7EIEy
 2iE0quRcuf/682Wl3u9uFmL6pZwklgMeye20+QTYNTpSeMAFgZfktN7L8mfmY2T8faVmzg6/u
 iwAMXsPkaLXWVcGkB7iXXcJM17asgf9PyFJFnnxxynV2RBrGw3932D/TIpUv3h60Les3ncrjp
 1cmivz+Zz9+PJW70uyU2/PAZsIXtmX6klwahPCvBZMrCcysIeMz3tfnVLtm4kxDQezpDfSLsk
 Q5mPk30NM8sfS4YktoSm//dvQma0WNyyia2UNayQ1DsFluzSgFRzz07r2OjWIx0+ACvniOYSr
 jVJWKXAM1i9O6Acny4ed028BCfOXOpjwqavw2oWGDSfs7AwS0eDUfpiDby3vGuJH4Ute1ps2/
 Ptqgb2109nEeA+iygn+wpY8vJbnbGFS3864Bz5wPfkg4vRQvwQTTAe9dA1mP2npbXdP4U92jQ
 p7TrIYJH9/F+GQ8Wsxi77UEoPPtXMQbh+YlAJBOIoZfQCbzv/GWXTcrUSnv5s5nYzQB5+AuzR
 zxhRZcMul4PskCsWe2hvGtKTd2kekH2/Xf0qiD6N+1qlOVGiuTkVpkRPq9H6f+D980oJzzRBF
 jwFgmlKm2zTPVC+6fSC8zVoAcyfj3k4CKOjmoospvDKACSv64Sh05mrzapAdS+M3lFq/awy2R
 06Oh3WLSMk1MK0Fd3Q3WcMG9DF3EsnEIZUupwuv/hdPrJydZG0Rzxtgqfutumo1gAgt0UJmoQ
 KiHTUzschQtReXMCWXQpdlz8QB8xs6OV5sC1YzMoiJHRsAPThFycjAtXBK2np26RkzpZnfM7q
 kuxfsZDqPq1YspLlB6q/+bYtUOSUy+3mXI1+X70wP+aoU5XiPBSKWifRtfH97lVFEOe7+f+p1
 GoddacdwG+vgpfjaIBOkFjJHOSNf1yGgexZpBAd+g9xvk+ffFR/0+o/o81QuJ5cByfRZJ+gcp
 ACMxyx3lW70X8o3Ni+JR1v9wElDEaOS1xreYxkOJDnqs66s6EGx107FXlrpBr5FrLE9cJ+uFK
 jHHFn5j9Ohbn225Eotajy2BCkSlbWuL7HNOUkEm/uTxv83JHLERZzWoAA5AtAX8nGSeyTh6pn
 KggN8nli2KeJvinuBZAhOsAzfBfT1PFbHojbjkgg1BA4m1pLreObp9kGGoxlJP1u1lOOimbpC
 dC2q2uQa8/CNCqU4/ebx8N0F7TGT5Ob4FJfEgXR2y3W0zGvgLwQEYQvw9h2LhO/pcIAsxxd3g
 CLv5iEipWEojCbInZ+cDpm5IqcyJPIQ5OTyu2e6gW4FWly6qtFCxJrKFhd72UE68cLuETyj7C
 kUX8nuj72HjMNs/FjIBHV8cG8tqoiA3Cg==

Am 18.11.25 um 13:58 schrieb Antheas Kapenekakis:

> On Tue, 18 Nov 2025 at 13:32, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
>> On Mon, 17 Nov 2025, Antheas Kapenekakis wrote:
>>> On Mon, 17 Nov 2025 at 11:30, Ilpo J=C3=A4rvinen
>>> <ilpo.jarvinen@linux.intel.com> wrote:
>>>> On Thu, 13 Nov 2025, Antheas Kapenekakis wrote:
>>>>
>>>>> The Ayaneo 3 features hot-swappable controller modules. The ejection
>>>>> and management is done through HID. However, after ejecting the modu=
les,
>>>>> the controller needs to be power cycled via the EC to re-initialize.
>>>>>
>>>>> For this, the EC provides a variable that holds whether the left or
>>>>> right modules are connected, and a power control register to turn
>>>>> the controller on or off. After ejecting the modules, the controller
>>>>> should be turned off. Then, after both modules are reinserted,
>>>>> the controller may be powered on again to re-initialize.
>>>> If wonder if the ejecting could/should be made to turn it off without=
 need
>>>> for an explicit off command?
>>> Perhaps in the future, this driver leaves the possibility open for it.
>>> However, that'd require a secondary HID driver to handle the full
>>> ejection process, with a shared function hook for this driver.
>>>
>>> The eject sequence consists of sending a HID config command to start
>>> the ejection, followed by a secondary config command to turn off the
>>> ejection bits and then waiting for two ready bits to report that the
>>> ejection is finished. Then, the controller is turned off. Apart from
>>> turning off, all of this is done through HID (so HID ready races the
>>> controller_modules value).
>>>
>>> The module status of this driver is only used to check when the
>>> controller should be turned on again and to provide visual feedback
>>> about which modules are currently connected while unpowered. When
>>> powered, there is full status reporting over HID, including which
>>> specific modules are connected[1].
>>>
>>> The end-to-end sequence is currently in userspace[2]. However, the EC
>>> ports are shielded from userspace so these two specific accesses must
>>> happen through a kernel driver.
>> So can the other features be used without this part?
> Yes. The patches are independent.
>
>> I'd prefer to
>> postpone this power/modules thing and have the ejection done properly.
> The ejection process is done over vendor HID commands, not through the
> EC, so it would need a new driver. This new driver would not conflict
> with this patch, perhaps a new "auto" value for controller_power could
> be added to have that HID driver control this.
>
> But, I do not personally have plans to develop such a driver. I will
> not oppose one of course but I cannot justify the engineer effort on
> it. The userspace implementation works quite well and this is a niche
> device.
>
> Since these two registers are in protected ACPI space, they need to be
> accessed through this driver, so this patch is necessary for that.
>
> Antheas

I am OK with using a userspace application to connect the HID interface
with the EC, as the ejection process already requires userspace interventi=
on.

Thanks,
Armin Wolf

>> --
>>   i.
>>
>>> Antheas
>>>
>>> [1] https://github.com/hhd-dev/hhd/blob/8d842e547441600b8adc806bfb10de=
d5718e4fe3/src/hhd/device/ayaneo/base.py#L90-L117
>>> [2] https://github.com/hhd-dev/hhd/blob/8d842e547441600b8adc806bfb10de=
d5718e4fe3/src/hhd/device/ayaneo/base.py
>>>
>>>>> This patch introduces two new sysfs attributes:
>>>>>   - `controller_modules`: a read-only attribute that indicates wheth=
er
>>>>>     the left and right modules are connected (none, left, right, bot=
h).
>>>>>   - `controller_power`: a read-write attribute that allows the user
>>>>>     to turn the controller on or off (with '1'/'0').
>>>>>
>>>>> Therefore, after ejection is complete, userspace can power off the
>>>>> controller, then wait until both modules have been reinserted
>>>>> (`controller_modules` will return 'both') to turn on the controller.
>>>>>
>>>>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>   .../ABI/testing/sysfs-platform-ayaneo-ec      |  19 ++++
>>>>>   MAINTAINERS                                   |   1 +
>>>>>   drivers/platform/x86/ayaneo-ec.c              | 107 ++++++++++++++=
++++
>>>>>   3 files changed, 127 insertions(+)
>>>>>   create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo=
-ec
>>>>>
>>>>> diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/Do=
cumentation/ABI/testing/sysfs-platform-ayaneo-ec
>>>>> new file mode 100644
>>>>> index 000000000000..4cffbf5fc7ca
>>>>> --- /dev/null
>>>>> +++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
>>>>> @@ -0,0 +1,19 @@
>>>>> +What:                /sys/devices/platform/ayaneo-ec/controller_pow=
er
>>>>> +Date:                Nov 2025
>>>>> +KernelVersion:       6.19
>>>>> +Contact:     "Antheas Kapenekakis" <lkml@antheas.dev>
>>>>> +Description:
>>>>> +             Current controller power state. Allows turning on and =
off
>>>>> +             the controller power (e.g. for power savings). Write 1=
 to
>>>>> +             turn on, 0 to turn off. File is readable and writable.
>>>>> +
>>>>> +What:                /sys/devices/platform/ayaneo-ec/controller_mod=
ules
>>>>> +Date:                Nov 2025
>>>>> +KernelVersion:       6.19
>>>>> +Contact:     "Antheas Kapenekakis"  <lkml@antheas.dev>
>>>>> +Description:
>>>>> +             Shows which controller modules are currently connected=
 to
>>>>> +             the device. Possible values are "left", "right" and "b=
oth".
>>>>> +             File is read-only. The Windows software for this devic=
e
>>>>> +             will only set controller power to 1 if both module sid=
es
>>>>> +             are connected (i.e. this file returns "both").
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index c5bf7207c45f..f8ab009b6224 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -4196,6 +4196,7 @@ AYANEO PLATFORM EC DRIVER
>>>>>   M:   Antheas Kapenekakis <lkml@antheas.dev>
>>>>>   L:   platform-driver-x86@vger.kernel.org
>>>>>   S:   Maintained
>>>>> +F:   Documentation/ABI/testing/sysfs-platform-ayaneo
>>>>>   F:   drivers/platform/x86/ayaneo-ec.c
>>>>>
>>>>>   AZ6007 DVB DRIVER
>>>>> diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86=
/ayaneo-ec.c
>>>>> index 697bb053a7d6..a0747e7ee43a 100644
>>>>> --- a/drivers/platform/x86/ayaneo-ec.c
>>>>> +++ b/drivers/platform/x86/ayaneo-ec.c
>>>>> @@ -8,6 +8,7 @@
>>>>>    */
>>>>>
>>>>>   #include <linux/acpi.h>
>>>>> +#include <linux/bits.h>
>>>>>   #include <linux/dmi.h>
>>>>>   #include <linux/err.h>
>>>>>   #include <linux/hwmon.h>
>>>>> @@ -16,6 +17,7 @@
>>>>>   #include <linux/module.h>
>>>>>   #include <linux/platform_device.h>
>>>>>   #include <linux/power_supply.h>
>>>>> +#include <linux/sysfs.h>
>>>>>   #include <acpi/battery.h>
>>>>>
>>>>>   #define AYANEO_PWM_ENABLE_REG         0x4A
>>>>> @@ -32,9 +34,18 @@
>>>>>   #define AYANEO_CHARGE_VAL_AUTO               0xaa
>>>>>   #define AYANEO_CHARGE_VAL_INHIBIT    0x55
>>>>>
>>>>> +#define AYANEO_POWER_REG     0x2d
>>>>> +#define AYANEO_POWER_OFF     0xfe
>>>>> +#define AYANEO_POWER_ON              0xff
>>>>> +#define AYANEO_MODULE_REG    0x2f
>>>>> +#define AYANEO_MODULE_LEFT   BIT(0)
>>>>> +#define AYANEO_MODULE_RIGHT  BIT(1)
>>>>> +#define AYANEO_MODULE_MASK   (AYANEO_MODULE_LEFT | AYANEO_MODULE_RI=
GHT)
>>>>> +
>>>>>   struct ayaneo_ec_quirk {
>>>>>        bool has_fan_control;
>>>>>        bool has_charge_control;
>>>>> +     bool has_magic_modules;
>>>>>   };
>>>>>
>>>>>   struct ayaneo_ec_platform_data {
>>>>> @@ -46,6 +57,7 @@ struct ayaneo_ec_platform_data {
>>>>>   static const struct ayaneo_ec_quirk quirk_ayaneo3 =3D {
>>>>>        .has_fan_control =3D true,
>>>>>        .has_charge_control =3D true,
>>>>> +     .has_magic_modules =3D true,
>>>>>   };
>>>>>
>>>>>   static const struct dmi_system_id dmi_table[] =3D {
>>>>> @@ -266,6 +278,100 @@ static int ayaneo_remove_battery(struct power_=
supply *battery,
>>>>>        return 0;
>>>>>   }
>>>>>
>>>>> +static ssize_t controller_power_store(struct device *dev,
>>>>> +                                   struct device_attribute *attr,
>>>>> +                                   const char *buf,
>>>>> +                                   size_t count)
>>>>> +{
>>>>> +     bool value;
>>>>> +     int ret;
>>>>> +
>>>>> +     ret =3D kstrtobool(buf, &value);
>>>>> +     if (ret)
>>>>> +             return ret;
>>>>> +
>>>>> +     ret =3D ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : A=
YANEO_POWER_OFF);
>>>>> +     if (ret)
>>>>> +             return ret;
>>>>> +
>>>>> +     return count;
>>>>> +}
>>>>> +
>>>>> +static ssize_t controller_power_show(struct device *dev,
>>>>> +                                  struct device_attribute *attr,
>>>>> +                                  char *buf)
>>>>> +{
>>>>> +     int ret;
>>>>> +     u8 val;
>>>>> +
>>>>> +     ret =3D ec_read(AYANEO_POWER_REG, &val);
>>>>> +     if (ret)
>>>>> +             return ret;
>>>>> +
>>>>> +     return sysfs_emit(buf, "%d\n", val =3D=3D AYANEO_POWER_ON);
>>>>> +}
>>>>> +
>>>>> +static DEVICE_ATTR_RW(controller_power);
>>>>> +
>>>>> +static ssize_t controller_modules_show(struct device *dev,
>>>>> +                                    struct device_attribute *attr, =
char *buf)
>>>>> +{
>>>>> +     char *out;
>>>>> +     int ret;
>>>>> +     u8 val;
>>>>> +
>>>>> +     ret =3D ec_read(AYANEO_MODULE_REG, &val);
>>>>> +     if (ret)
>>>>> +             return ret;
>>>>> +
>>>>> +     switch (~val & AYANEO_MODULE_MASK) {
>>>> Thanks for adding the mask.
>>>>
>>>> Now when reading this again, I also suggest changing variable name fr=
om
>>>> "val" to e.g. "unconnected_modules" as that would make the reason for
>>>> inversion more obvious.
>>>>
>>>>> +     case AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT:
>>>>> +             out =3D "both";
>>>>> +             break;
>>>>> +     case AYANEO_MODULE_LEFT:
>>>>> +             out =3D "left";
>>>>> +             break;
>>>>> +     case AYANEO_MODULE_RIGHT:
>>>>> +             out =3D "right";
>>>>> +             break;
>>>>> +     default:
>>>>> +             out =3D "none";
>>>>> +             break;
>>>>> +     }
>>>>> +
>>>>> +     return sysfs_emit(buf, "%s\n", out);
>>>>> +}
>>>>> +
>>>>> +static DEVICE_ATTR_RO(controller_modules);
>>>>> +
>>>>> +static struct attribute *aya_mm_attrs[] =3D {
>>>>> +     &dev_attr_controller_power.attr,
>>>>> +     &dev_attr_controller_modules.attr,
>>>>> +     NULL
>>>>> +};
>>>>> +
>>>>> +static umode_t aya_mm_is_visible(struct kobject *kobj,
>>>>> +                              struct attribute *attr, int n)
>>>>> +{
>>>>> +     struct device *dev =3D kobj_to_dev(kobj);
>>>>> +     struct platform_device *pdev =3D to_platform_device(dev);
>>>>> +     struct ayaneo_ec_platform_data *data =3D platform_get_drvdata(=
pdev);
>>>>> +
>>>>> +     if (data->quirks->has_magic_modules)
>>>>> +             return attr->mode;
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct attribute_group aya_mm_attribute_group =3D {
>>>>> +     .is_visible =3D aya_mm_is_visible,
>>>>> +     .attrs =3D aya_mm_attrs,
>>>>> +};
>>>>> +
>>>>> +static const struct attribute_group *ayaneo_ec_groups[] =3D {
>>>>> +     &aya_mm_attribute_group,
>>>>> +     NULL
>>>>> +};
>>>>> +
>>>>>   static int ayaneo_ec_probe(struct platform_device *pdev)
>>>>>   {
>>>>>        const struct dmi_system_id *dmi_entry;
>>>>> @@ -307,6 +413,7 @@ static int ayaneo_ec_probe(struct platform_devic=
e *pdev)
>>>>>   static struct platform_driver ayaneo_platform_driver =3D {
>>>>>        .driver =3D {
>>>>>                .name =3D "ayaneo-ec",
>>>>> +             .dev_groups =3D ayaneo_ec_groups,
>>>>>        },
>>>>>        .probe =3D ayaneo_ec_probe,
>>>>>   };
>>>>>
>>>> --
>>>>   i.
>>>>
>>>>
>
