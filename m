Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B03410D0C;
	Mon,  9 Mar 2026 19:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085514; cv=none; b=TPNn1V/lkJTli4hXudsPJ/MLxLAdS93MhmGXo0P+d85SuGl+M8zNTm/6KbA0j3DXG/gEO+bwhsiuJlcrJhCgqoylkYa0YnKfZ/lrB9NKNLM3bW/B3pR98hQDgbTxxnzs7RlWrOcbPCZPR9Dh9Nk3FYvlw9UT0FmdpCap/uT3yms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085514; c=relaxed/simple;
	bh=iLM9DEWCiMRWoUiSGzAlqc5ArlSQKrV1CbBg/DWO1jQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2CMqLwnIDLwVeyOfMrg0aqORM+7hoUZwxz5rTePSg2U8WXlGTq0dRfzZbpL65SKa1JWaQw0udCbgOXtr1vgmGOOsv2Wq2If2sA/Y/hxolNpYRRYUemfALdsUPLSl7YUK3dcAfu7kejfV9Cheb8qPDBEajQuo4qB+WXbDAnZWKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=J5eg8kzk; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="J5eg8kzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773085507; x=1773690307; i=w_armin@gmx.de;
	bh=t/oSVD3AhMjnA4/qE3TG0NbhFhOM/Kfc+oTBAtYWFyA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=J5eg8kzkHCimzlfjy0bIOequsvuHQGqmL+50AJx5pmOkobePLiZtVXdCYJAw6Evw
	 D6iHnyhU42SAB9ZJgADqYJXLBi17QYATcMD0i4865yu7rkYXHIPY5JQ0D7Vfv0pMX
	 z+WPrHC9qTksgIVAhlnxo525SRIhyKNOEgtzER61+PsezUSdR35qPjOruK7/jMOTp
	 y2k4lbMzC7WebHy+XVk6BuHGUtLAV5QQ/5dNf/E7fr66GKGLZOZxU0enaJdHRczR4
	 53LkADjOweP7ZpCo05ovV5JGBIeF0a9kf4KNqApefg1xpd3Z2n2rYYtwoW2gQIM6m
	 jPwJS1tm0Drc8M/a/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3mt-1w5V1M20pX-00QCbF; Mon, 09
 Mar 2026 20:45:07 +0100
Message-ID: <c1957ff4-964c-4651-93be-056ea4d9004d@gmx.de>
Date: Mon, 9 Mar 2026 20:45:04 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] platform/x86: dell-descriptor: Use new buffer-based
 WMI API
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Dell.Client.Kernel@dell.com, mjg59@srcf.ucam.org, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@roeck-us.net, linux-hwmon@vger.kernel.org
References: <20260308002522.4185-1-W_Armin@gmx.de>
 <20260308002522.4185-2-W_Armin@gmx.de>
 <39bdcdf7-a771-4f1b-a3a0-0ecde272d914@amd.com>
 <20260309172309.a3ukif3bejbicywl@pali>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260309172309.a3ukif3bejbicywl@pali>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EiTP33bNXUx+JETuOzgZ/6tx1LW7e38ey1ugyJnSLcMNaWPHlcA
 CDgPb2UrvvCGZArmTZT2XW3LSPYsnOOSRWtM0RILijEiHSdGt6UsZDakusElAeQ3I3NmmcP
 Qt9VMQQfrRnPMFxpN7iXxocpxcPsJzs3cLJgT52WVQ+4eiChJwCR90a1Xp9B3Tq2qRRMqKb
 Ax0B/riStWgJs5HRME17Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2QjHmaDNKvk=;KwHKM7jayZOLm2JecJQqvDmOrbk
 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
 V3U9+2GRAXFjgEWckZ3dktQm+y/+V

Am 09.03.26 um 18:23 schrieb Pali Roh=C3=A1r:

> On Monday 09 March 2026 10:41:20 Mario Limonciello wrote:
>> On 3/7/2026 6:25 PM, Armin Wolf wrote:
>>> +	/* "DELL" */
>>> +	if (le32_to_cpu(desc->vendor_signature) !=3D 0x4C4C4544) {
>> Do you think you could come up with a helper for matching an expected
>> "string" like this?  I /suspect/ it's going to be a common pattern that
>> vendors use and it will increase code readability going forward if a he=
lper
>> is possible.  I see it at least twice in this patch alone.
>>
>> Something like this prototype:
>>
>> bool wmi_valid_signature(u32 field, const char* expected_str);
> When I read your comment, I come to another idea. What about introducing
> a macro which will convert 4-byte string to u32 number? For example:
>
>    #define str_to_u32(str) ({ _Static_assert(__builtin_types_compatible_=
p(__typeof__(str), char[5]), "wrong type"); (u32)(u8)(str)[0] | ((u32)((u8=
)(str)[1]) << 8) | ((u32)((u8)(str)[2]) << 16) | ((u32)((u8)(str)[3]) << 2=
4); })
>
> The whole conversion would be done in compile time (with -O2) so should
> not cause any possible performance issues.
>
> With it, the condition could be written as:
>
>    if (le32_to_cpu(desc->vendor_signature) !=3D str_to_u32("DELL")) {
>
> and no need to use magic number 0x4C4C4544 and write comment that this
> number in ASCII is the "DELL" string.

To be honest i do nothing think that having a helper function for this ins=
ide the WMI driver core
is useful, especially since most vendors other than Dell do not use such m=
agic numbers.

 From my perspective assembling the two constants ourself is fine here.

Thanks,
Armin Wolf

>
>>> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid vendor sign=
ature (%u)\n",
>>> +			le32_to_cpu(desc->vendor_signature));
>>> +		ret =3D -ENOMSG;
>>>    		descriptor_valid =3D ret;
>>>    		goto out;
>>>    	}
>>> -	buffer =3D (u32 *)obj->buffer.pointer;
>>> -
>>> -	if (strncmp(obj->string.pointer, "DELL WMI", 8) !=3D 0) {
>>> -		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (=
%8ph)\n",
>>> -			buffer);
>>> -		ret =3D -EINVAL;
>>> +	/* " WMI" */
>>> +	if (le32_to_cpu(desc->object_signature) !=3D 0x494D5720) {
>>> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid object sign=
ature (%u)\n",
>>> +			le32_to_cpu(desc->object_signature));
>>> +		ret =3D -ENOMSG;
>>>    		descriptor_valid =3D ret;
>>>    		goto out;
>>>    	}
