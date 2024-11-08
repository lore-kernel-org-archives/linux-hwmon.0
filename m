Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B6615B0F7
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Nov 2024 17:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731086558; cv=none; b=bno/S2fKHaeYFOBtnCWgUpjWK3cG3dzlE3Po7y3wIpJty+86ky/MVBFCtCTToxbNPMpd7W366GVb2aW1E3m3mpmOdQVJJHbE/l33vDgZCg0Xf/sF4ajjAFh82i1zFYmykCDFCwVpTf3V32mFOSs95FoodQdgUcxQjnzQam5O+S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731086558; c=relaxed/simple;
	bh=+JtIc2ghPqV9cfXlXpGCOwoqyFL1IMoCWLXNe4ObHb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbhEJjunN6EExRuH8JQBlwOTGm4VKhsg3zgAleIL4C/1qQ3xAqERcm3ePzdPLZiMdl387p8V2EIdbPfJp5HZPOTHqcLULhheX8JSjcUDW2AGEYZeVTpqfQUURuNc/9koINJWDATbe7Wsls46IMhizVm21TFHqx+RA8u05vmeMpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QEmRpXDS; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QEmRpXDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731086537; x=1731691337; i=w_armin@gmx.de;
	bh=+JtIc2ghPqV9cfXlXpGCOwoqyFL1IMoCWLXNe4ObHb4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QEmRpXDSAeGBBUq2CPWcjTUrj0J49TzoJtDXGd0dszFiLcDeR/F/CZdgL6CoEiMC
	 bzC5IbXB7MgUvcZe2eef9QoYJM5qQ2n7wR9TvC6YF46fvcotoNuUix/16LkyxlrxO
	 7QwjAQDt+EI8+WMqElflCZXU6IKbkPIKJX572jmTjLv9z870mPzIGZMsJBIITGJkA
	 sIjr2tAHjUlyVkL+8APXgpTWLIhbRDDatg3PJx6ERLp3d1vqINeBpgBa17OyvphGB
	 ohh9gJtiwJWLnl7U1zXZLkSlvmcydXio4o40YM/4L0VB8EjQjP1d4v7jZMjcXsbEX
	 u3oFDFXu8q38quSWBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmULx-1taJ7w2Y0f-00kNb2; Fri, 08
 Nov 2024 18:22:17 +0100
Message-ID: <5ed69c5d-11e6-4c3f-b934-886525f91b87@gmx.de>
Date: Fri, 8 Nov 2024 18:22:16 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CPU/GPU fan control with safety via hwmon
To: Werner Sembach <wse@tuxedocomputers.com>,
 Guenter Roeck <linux@roeck-us.net>, Hans de Goede <hdegoede@redhat.com>,
 linux-hwmon@vger.kernel.org
Cc: Juno Computers USA <usa@junocomputers.com>
References: <172b7acd-4313-4924-bcbc-41b73b39ada0@tuxedocomputers.com>
 <f26d867e-f247-43bb-a78b-be0bce35c973@roeck-us.net>
 <a73488bf-fd53-4894-a47f-8d76148b5e10@tuxedocomputers.com>
 <94683c23-ac6e-4bcd-836e-a1f3dfea5768@roeck-us.net>
 <f7fd21ac-b286-4c5c-ad97-7d8d64d175b4@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <f7fd21ac-b286-4c5c-ad97-7d8d64d175b4@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:auX7cZ3AwCUXb0uWsvlDIkw7XM8IKTa+9Ppt3hQs1zcL6xIKVfS
 xc55zycTfRKvL6ZdTeMP1cslXKB/7dUPN5NVH54P4Kos7Fp4dEINTEYFWxuZms4ef38+RtK
 cJmm7miTobsjTfunQOkF9OT/2hsq8thn3RBWQDuoRC6VXMF+MTHSAYMhUzflT4eqBWYzdZ1
 7xFp4rPTS86gOt1HwGkrg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:owpxvw22Kys=;TzpzO5qeyXR353CrAfjuFgHHCGr
 0u6a5W82p3TQznqJqmFg6nOHveaRaXEJqgYN69Ke68xXw61bTnYycYfJihmkbPeoCEWO8zOo4
 9fOQOLs9v5x8HNf+DIdDNZv10peSF/keDP35qAAGAK5d/NF0k0dXz7R0uA86/LP8sxhe5rsNt
 TDhp3T1GaEBDSmDOucaQlb5eBWhc51TfQqp6YNfg97HYPTSjIVJMlm/uVrwPBKBOVQ2XFh+Um
 1++OqsX0ZTYRc5kHqswR+M/CdWICNm+QW5pBNWCkuEokYnPk38D1Am86/QfD0GY2+zeCw4jPE
 s3az5Pz/R3ATLIojASZAA1qaqvmjrQULITD/yOnivBTqTI8g6KBBtSITYdIUOBedVKbprDpm2
 ilFiJvRrWjCK+tAckJ49tq8ZX55OEyGjsutPJmykwAwZLpOLK9nRCLQpqE8Ea66mUZLuY6KzX
 RbtO9/rE7Z9Fyl5JqFUlqdLxcNhoIKFQvuk0pi10YRW3jZg4le4TjwPeYpQTMQEQ3JFCOGoLT
 Y37+a2bwQLSdmUwCeS8YEHL3yxCGXNU/QGk8dFYhsEh/OdMPUdhjoWLwDMIlqMMDHlcTQDl0k
 kB+cG4Wu4fserKZj1UGhcnjmBRz3zi77U5VCiVEqjCJW+p9pHLsqTcDyCq1c9cw1qwQiz1gGK
 pEBJ2lLwzvjPtxYdNJLgqKun0AmAAhTbPyWFGiyXW2LXniHUDF44rvNZhZcZ0SpJHTbrXuuBv
 vGxl99DA+sM3SWSE1Oc4NtMmOV7RTbm8m3XKhkTUuZGRWDwzt965DGg5iXeLBHlCjkEmBHht1
 ZbMW9vPHBdpI2VJpqBZk951IoXDPLfa4Er+02r9Ga08Y16ENHIORJsjQPgiOCJLOEyz51l89L
 Sfm691uVQZecAQB3yct5ovxt7W+yq5fIndgtfK7EmoT++lwcXC7QGPjGW

Am 08.11.24 um 17:57 schrieb Werner Sembach:

> Hi Guenter,
>
> Am 08.11.24 um 17:26 schrieb Guenter Roeck:
>> On 11/8/24 08:13, Werner Sembach wrote:
>>> Hi,
>>>
>>> Am 08.11.24 um 15:30 schrieb Guenter Roeck:
>>>> On 11/8/24 04:05, Werner Sembach wrote:
>>>>> Hi everyone,
>>>>>
>>>>> I'm currently conceptualizing an upstream implementation for the
>>>>> fan control on our Sirius 16 Gen 1 & 2 devices which has the
>>>>> following custom WMI functions (pseudo code):
>>>>>
>>>>> void SMOD(bool mode): Toggle firmware controlled fans vs manually
>>>>> (aka via the commands below) controlled fans
>>>>> bool GMOD(): Get current SMOD setting
>>>>> int GCNT(): Get number of fans
>>>>> enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
>>>>> void SSPD(int index, int value): Set fan speed target as a
>>>>> fraction of max speed
>>>>> int GSPD(int index): Get current fan speed target as a fraction of
>>>>> max speed
>>>>> int GRPM(int index): Get current actual fan speed in revolutions
>>>>> per minute
>>>>> int GTMP(int index): Get temperature of thing fan with respective
>>>>> index is pointed at (CPU or GPU die, see GTYP)
>>>>>
>>>>> However there are some physical limitations that are not in the
>>>>> firmware and I would like to implement as low as possible in
>>>>> software, aka the driver, to avoid hardware damage:
>>>>>
>>>>> 1. Valid fan speeds are 0% (fan off) and 25-100%. Values from
>>>>> 1%-24% must not be written.
>>>>>
>>>>> 2. As long as GTMP is > 80=C2=B0C fan speed must be at least 30%.
>>>>>
>>>>> We would love to see the same driver enforced restrictions in the
>>>>> Uniwil driver Armin is working on and the Clevo driver Juno
>>>>> Computers is working on.
>>>>>
>>>>> My Idea so far:
>>>>>
>>>>> 1. Round SSPD input: 0-12% -> 0%, 13-25% -> 25%
>>>>>
>>>>
>>>> That is acceptable.
>>>>
>>>>> 2. Periodically check GTMP (every second should be enough) in
>>>>> driver and if the temperature is over 80=C2=B0C set current and
>>>>> incoming speed commands to at at least 30%.
>>>>>
>>>>> Is this legitimate with the hwmon design?
>>>>>
>>>>
>>>> No. That would have to utilize the thermal subsystem. hwmon is not
>>>> intended to
>>>> _control_ the environment, only to monitor it.
>>>
>>> Thanks for the hint, I was not aware of the thermal subsystem until
>>> now.
>>>
>>> But still wondering, doesn't have the hwmon interface also some
>>> write functionality? Or am I completely mistaken here?
>>>
>>
>> That is to set limits and other chip configuration, not for active
>> environmental control.
>
> From the thermal subsystem I found my way to this page:
> https://www.kernel.org/doc/html/latest/driver-api/thermal/nouveau_therma=
l.html
> -> "1: The fan can be driven in manual (use pwm1 to change the speed);"
>
> So it seems like the thermal subsystem is exposing a pwm hwmon
> attribute itself which can be used for manual control.
>
I don't think so, the hwmon interface is exposed by the nouveau driver its=
elf, see drivers/gpu/drm/nouveau/nouveau_hwmon.c for details.

Thanks,
Armin Wolf

>>
>>>>
>>>>> Second question: Is there a good way to implement a userspace
>>>>> controlled switch between auto and manual mode?
>>>>>
>>>>
>>>> Only if that is a direction to the chip to switch between modes.
>>> Yes, via WMI you can set the mode to "manual", then you can use the
>>> wmi to set the fan speed to whatever speed you like. When it is set
>>> to auto, the EC itself applies an internal fixed fan curve.
>>
>> The standard attribute for that would be pwmX_enable (since fans are
>> usually controlled through pwm).
>
> Thanks for the input so far. I have to look deeper into the thermal
> subsystem.
>
> Regards,
>
> Werner
>
>>
>> Guenter
>>
>>>>
>>>> Thanks,
>>>> Guenter
>>>>
>>> Kind regards,
>>>
>>> Werner
>>>
>>> PS.: By missclick I accidentally sent an empty email before. just
>>> ignore it.
>>
>>
>
