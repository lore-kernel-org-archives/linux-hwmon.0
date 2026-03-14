Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2160212D1F1;
	Sat, 14 Mar 2026 17:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773510973; cv=none; b=AIE6lnG4SleWpR+gGifqHJNAWgADD1rDFCm9DNuv/TpFT7fP1oZn+5EqP5pyqr8ceG1n9fKXy5gx5SF0pVgXSQqSFVpekjRf7jo/UThZYjoSdhuud9C4NYaMw0v9AgmL73FG6/FArlIXCQyuYuLzWGC/BBl/VLxu9dKIpr69RuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773510973; c=relaxed/simple;
	bh=YUXgIRN1+5p3e6QH8h+HXNMyfbwvjtB1omhYJ8YqT1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXb/UlFpwlG9wkXsMsNImGy3wp2vkDde1uRXjWa97teRU+zQJO0dszwKRjNmme/VmjjKGGYDBRe2iY73Wl6LlHtaOehJuTdjqGdPfNzDiD4F/TJMUG701aYEe9kkg4K9LFI+iQzhNF9lSMDdA3hWxXOYMElJkKK4b2SOGUfOtDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mfty7D45; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mfty7D45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773510945; x=1774115745; i=w_armin@gmx.de;
	bh=Pk6axAn+i1ktnNwJtgw7qfDlrVkyf9euDc/ywzLzuBk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mfty7D45x89BbeQNOfWe1j0glks6sLaPAXk4sDeofgog4lPAk8u5gv5CMg3jo8Pl
	 6KHlcM6mcvLwaZ6MBv9hVMlZuKkcVtuOTwYSvt93nqp/xL6ewOerargIFrt+sss6S
	 aP6sX0WfZ4eVNddcdF6tN2H8fYCSbLB9EwY50vqVuNNH+DBGrNglu0+R7JrSdcZ8m
	 elPLj0kghkhV4ARoG3w4wQFL2TULJY2W4zmvuS65TLiiMNEodHWFOt7T0PGHJza/R
	 2+smtVclC6K+D4fI6wm/bQX+jdAiACH45YgqZKPx4uN0OkBbglwH/xNy8XTp9sgVF
	 uV7O3Y4MJmO1O0+HjA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1HZi-1w4EN03lYg-0020Eo; Sat, 14
 Mar 2026 18:55:45 +0100
Message-ID: <2588570c-87b6-4352-9af6-9fac6f6721c2@gmx.de>
Date: Sat, 14 Mar 2026 18:55:41 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] platform/x86: dell-descriptor: Use new buffer-based
 WMI API
To: Gergo Koteles <soyer@irl.hu>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>
Cc: Dell.Client.Kernel@dell.com, mjg59@srcf.ucam.org, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@roeck-us.net, linux-hwmon@vger.kernel.org
References: <20260308002522.4185-1-W_Armin@gmx.de>
 <20260308002522.4185-2-W_Armin@gmx.de>
 <39bdcdf7-a771-4f1b-a3a0-0ecde272d914@amd.com>
 <20260309172309.a3ukif3bejbicywl@pali>
 <c1957ff4-964c-4651-93be-056ea4d9004d@gmx.de>
 <e0fb50490d733ad35807be79b6f4b91003897d10.camel@irl.hu>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <e0fb50490d733ad35807be79b6f4b91003897d10.camel@irl.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wNIsc+NjZrA4nF+ink+kGc+eOQDwBSsSAu8ruKe3rzWLrckLFv5
 7rl0YydL2M5p7/+Ic0VGh0CVfAL0pUMptqhgZSVttl3drBGx+dAtMFHpe6QrfRdttrIAs94
 rKI4brmaqJTzkMkxPpWLqitqYiKQ6iymvzAWCe3IA8hm1YEdRsSMQxW6OotWnZeEdwY92eQ
 4635qypQQXKwYjMM2/Tsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lj6sBr2ox3I=;2z9AfbqBNGSTDwdK8pYOVXTLKuT
 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

Am 10.03.26 um 11:46 schrieb Gergo Koteles:

> Hi Armin,
>
> On Mon, 2026-03-09 at 20:45 +0100, Armin Wolf wrote:
>> Am 09.03.26 um 18:23 schrieb Pali Roh=C3=A1r:
>>
>>> On Monday 09 March 2026 10:41:20 Mario Limonciello wrote:
>>>> On 3/7/2026 6:25 PM, Armin Wolf wrote:
>>>>> +	/* "DELL" */
>>>>> +	if (le32_to_cpu(desc->vendor_signature) !=3D 0x4C4C4544) {
>>>> Do you think you could come up with a helper for matching an expected
>>>> "string" like this?  I /suspect/ it's going to be a common pattern th=
at
>>>> vendors use and it will increase code readability going forward if a =
helper
>>>> is possible.  I see it at least twice in this patch alone.
>>>>
>>>> Something like this prototype:
>>>>
>>>> bool wmi_valid_signature(u32 field, const char* expected_str);
>>> When I read your comment, I come to another idea. What about introduci=
ng
>>> a macro which will convert 4-byte string to u32 number? For example:
>>>
>>>     #define str_to_u32(str) ({ _Static_assert(__builtin_types_compatib=
le_p(__typeof__(str), char[5]), "wrong type"); (u32)(u8)(str)[0] | ((u32)(=
(u8)(str)[1]) << 8) | ((u32)((u8)(str)[2]) << 16) | ((u32)((u8)(str)[3]) <=
< 24); })
>>>
>>> The whole conversion would be done in compile time (with -O2) so shoul=
d
>>> not cause any possible performance issues.
>>>
>>> With it, the condition could be written as:
>>>
>>>     if (le32_to_cpu(desc->vendor_signature) !=3D str_to_u32("DELL")) {
>>>
>>> and no need to use magic number 0x4C4C4544 and write comment that this
>>> number in ASCII is the "DELL" string.
>> To be honest i do nothing think that having a helper function for this =
inside the WMI driver core
>> is useful, especially since most vendors other than Dell do not use suc=
h magic numbers.
>>
>>   From my perspective assembling the two constants ourself is fine here=
.
>>
> But what about the other readers? :)
>
> Why don't you use a char array for the descriptors?
>
> struct descriptor {
> 	char vendor_signature[4];
> 	char object_signature[4];
> 	__le32 interface_version;
> 	__le32 buffer_length;
> 	__le32 hotfix_number;
> } __packed;
>
> Best regards,
> Gergo Koteles
>
Fine, i will model the vendor and object signatures using char arrays.

Thanks,
Armin Wolf

