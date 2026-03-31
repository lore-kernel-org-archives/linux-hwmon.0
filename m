Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A04317152;
	Tue, 31 Mar 2026 20:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987246; cv=none; b=gGIdT9v6CHskpoU2wdyoVx/mQyc/sSH4EiM6BJlrVmlQ5vHj+gVUWHjDetrTrrewkMP3Qubu4kEkMoStB+v0GkiLYo3E54xNLyy7MuB7R/1uhMUsBX0tGNrqUfpDQ0B+mpv7LZ615jQk0bl59ASI7R1BqCYuwdgUN7djZX1Nk/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987246; c=relaxed/simple;
	bh=JYf8m+uaIht4FgAQN+5H4n+DI/G8p/7lrMml67ptuwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUK2dXtmaNASnTgFAYgfSnnF5ABq5f4vwDqd9lzzCdCgm4OzMKf0SOPNueFnPZnaV3KEkzmqiSZxBeeoNeg9S1SqYFOpwyPzjh1PM5hwD5iHlC6ucu/toSxmDwBoVS2yTMZMFKTXwMdLROeSE/3QfDvZxwZ9UviLeg2S6UAqhLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mXyJJLVT; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mXyJJLVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774987235; x=1775592035; i=w_armin@gmx.de;
	bh=BP5tjpbhegx44DBYQWUHfmgyEi7OtYbYccluuyjuSi0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mXyJJLVT4KvQ9QG635QNJRTJD9FEZbp4yslFj3hVzGt2aC888v2Lm4TXkuY48o5V
	 4u/NkwIBEH+YR4qnEH+fOtdNV42MU6S3tmOXkoaQJ3zFHIXK95kU2SO53Lh4GApek
	 XQNvURh5Wf0rY4qzXkD7QD+xx/Kox3RpK9zZPs3UskIqUcNaksdmeGlsgS+ITkZdc
	 HCCRWai/jN4T2X/gu9NQUEB3joOlmLF7RwePk11fuWyLS+a4C3JGEZuPGi/fJhVEv
	 7AZqnnHgfwon9jt3o5osXNYZD6JR1EuphO+s/ea143zh4Fm0TRPCiuIcVy9vagDNS
	 BS5KkHfKuFzrjH/PMw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD2O-1vdZJJ2aKw-00g6Ze; Tue, 31
 Mar 2026 22:00:35 +0200
Message-ID: <44633ad0-2b80-40db-9655-e0eddb3fa02a@gmx.de>
Date: Tue, 31 Mar 2026 22:00:33 +0200
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <658006e6-bbfe-03b4-f788-8f041adda03d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xk/GAUBb6O2CKTjfAmvHXHJnGi97eLSdbpCiDH8bwm9HZ//ZeNQ
 Ng7LV4JT/qNu+f/yBURZpb+mQmwn1J1q9vvH+Hy68OxQtgAIYoSYK4bkLI5MJx/dWnw6MVL
 WJfos1Nxz7nenkCjVoFpKsXr3lL/aXORDEhjO8r9zrFZuxid6yh7pduSZbEIj0y4VB6qwYQ
 1zsGPY8yMFzU7qbAxsd8Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tvMO0XPSV98=;HrKqMLwRpTdvXlaIQ61Q4H96D1T
 Rr3+I3V7YxuXenizexZLuV0riY1RtO4oJHyXgGg638e8eFxhr/42GHkYKNV/ViV6KF6cGP4B3
 R/4kBfZOhdaVl9N+63cXTk+S/Y4Vb5U/CkJTxT1N1w8eWi+xhqYWKVFZBe0C2Iplk3QzV9sk7
 o+wmipWh7jMOObCxnQBpKHj1Byyrewe8lAdhbIfQG3h2YuQdyTb3NmS+rH1LVqT2TfdjYtjh7
 FAgf0/LLukHA0wWfhWIUVVFrwPWLPKHe3DhrQZxiewYVP6I5j1CUqXu6sB+sMJKh07pCIT/p+
 j6XasPPJ9SGDMFVEZxL+SFArVaXBZCGca/+IBv7DMhjQA/OV9PVgzjr96p6MsD5aEhP543DBQ
 +yJDfCuY8i7Y/sClB5oxhBNw43EMdc10D0puS/pnQrGeLEEGzUUvzKYjfDQ2tvV6D6gtaRipw
 CG0JGIJTKFKUBiXd7aMuKe6Lk8jBduuBfhw6XJZ0d3qoG/CvR6FV8QV0xYwXLGpe4qPfm+T6I
 rgZ1uEwjKSCuqhYOiAdtEFL1EiL6qgZc7f20+4cy/FXJxzI8OhFIFl/jk5TyoRo91hryKS5la
 2fLyTqUaFp43gQ1oHjkeV9MqtkgUd7UbfiIAlOQrOouusKeV9Q2spLxmrketvFGP6NCAQNq54
 O1p05M5i+OzXtn19UEXEeQ5rGgURd3tCozEH63p4DZDp5EgSQHDpl9qo2G/+2UuP70iK9AH4C
 jja9KvdiPOLYuK4SMILwUieIrwjYvhCQaSOq8ArwTL0ZYxLEVn1qJDMJjgcrMtwK/6ekkmzaz
 mDnsvbXuZGvLNZW39drZbUOgxONiZD389Fg8wtbnNqp7V3+Wn+cSy0BcFpc0Hu6n5oPv+f0xS
 mNZF5wgSeBTBVprWut/aCr7C+dF0NymmrjPvvXqbMf9BqHtotd0iWbLj68nNYJJaS6Qxu1Z8b
 VONVxZ/Mlvdn3rsDnbYYTY8sxo7hMogftHLADkuDEMzRuzwyeR3zWwzRoUhARzJW2eOOVrrSr
 9QUzPIEBIOLmwPwQeWD4IFsIfi4CABkoH48OQWfsowLJw7fFyoDquPC+1U9HEdw8wBpoORqKg
 iY3uOZ39+tmGwx8EJMwrCsl7PjQeRBgD6yA3lkgNHAA6UkM7lebdW4lLUgg06nI3h/IU+e0xt
 LG7UryF7tr+pxx1wSqEd0h1cMpNOVAbntn1rsPeTKXriVjC80rq+p3noWrZZovczeNiYHuy44
 D5e1O6YkbiJq2JBurHaO6HmpCDOKrgztoj9claDHbijqZrpB9h8Jpq3wrOZOV9mWwZS/Klqlh
 AGBKroLxT4Xc674yTl5GLk1xR6a8Y5dKvCsoee8CiPOXIKqEB+bOqI5wSoBTAGpDdbZ8patey
 0/HQfEC9mqUuJ5Gv2dbVuvrhNirwO7G/DL8AKEcd4DLBGWUvUaVL/qonSa2bf/poYc04qLNVm
 kMjlC9q9BiASaq6GZBtbzwtN5ews0LvFNQwZYlX7gITsTCVtGr6BRlyx1LnsWhNiMbxnP3g4x
 JBGlxntm6oc82Buvt43ATP0sClQ+MqKHvi8FH/f3bDCotUbSf5wYWyerjphH1jK6Rr3y7J1mN
 kn+X+yrw5SILI7y2TJ8mATvULTn6hYxMaUqMxZbQKtpR+huDrDWO5RG14hRjFKPqXXBaMx1RJ
 rqsV1OLUB8u9+e5hnIfqQs5x1rCp0o7Ci3A7dRLhGF+eKyCkSQaYtsZCiXT7T5WNLyTUEarAg
 rJrmjbYx8fKckusCtQl2d28/Gly0kcFvhFbkTFNo4pT0xLHVdURF6+0UbZX+r5mSq0gbk4OjN
 7Ek2MpkJXWaRsLcCa4cCrSA5Tps+DPD5yit5BC4Ype/N40iU4ielKJwwCMMrKRws5Pkja4I0g
 ohJosd5zv6gmnzHALW+jiylBMxtoDZvFigBiAwBB3e3YcHn0ZelDkIKg6XoVslT19z50XMnAS
 7k1wAHE21Gfuhfh9SPMqqLrpgI2U1NtPR0fPHq9wz2EqCAi7WCoWUpGRBYdh5uhfd3ONS3RkT
 29ohJaMolMd9b+bxzE8ykDyFJBp3UYKJ7oq00htbJcYZa0tIylykxLJBUQeZ2eJ4xcqq0vit2
 s4wzww63k8uqGfatS4msk9tD8hnecQm/K2FKo+inPbh6TeMyIn8YGch+28Z2bj/RSHtyOHWXM
 9Q7uRosmpWOWpiOwOAZ0BPA4P9rGOJad+XL/iHn11YTbch5r7C0n63VYPJRD1ZEXFpHOXbS2D
 NHW9VH8az6wd/wr5msoSNSmpFXcs6v8l+31mI4NKp/+3c6xPq1BkfMjwyRYsBrcx5CjHPZ5Nu
 B6aPI7zazl9AHekDiJyUtS/ZAZhXD6SyPU5f2xfLsuV6pmoiA9GBmXIpxjOG4xljBTKUUxi04
 40DU2CzkBL+bir88zRuTWzqifHIbPZJhwKANNaV6nOxRIMhHMCo4o2exud7S46ekhl4xHMpB2
 3N869nngSkSFKSxJylo7JmcnJ0iphJvt3Sr3VI1BNq3Ybea+rbjcwdpmlZkSJ4MjMGiR5ptir
 UhnKJeUfE1f2HjldT7QkZcoH/xReG+jBtmTi13h3WirGOGuv71FgvsaB9bK4JlQYS3gBjD8q+
 mgvPVtHHG0SHLNo40IrquBJ4e4sG48rQNtHKG9QqojVMBAuGUqRMzGCrZ6HBK13upez397ZjS
 CNVo4ytRFmyg7Q1bUtcxqdwc3jRq9LNm/WTDeWqDXGenNr2U3NhFZirnGcVdJBgxusPecP9l5
 iL7GlxwCD15RuCbPjtAtfayXkIUENwsvqrWhKoNqb7gsXVehcV4MZlyl9jW2zj4R8Szjm9Gbl
 +SOdblFZl5+0EBcAMqlc155HYQoL5DjXvLvS/hJGSbP3Tbzf123sVV7BI8LSn2VgKFdpS7QZ4
 051FOfnrgbsr/QKtrvFjGHud52SYo9lJMu/J4xCncWpBNEJnQJyXY0udJrf85s0ZC+jkdOrGa
 MatmloDPEEF1DAdzTT/M0cWzQYrhXBxjhsUisbb4bBWL/UEy9r54PTerxN1SgiY6A/VXIWGua
 udFge2Jx6Kz/qese8ZJ86WPjxoHsuolVzxdVmeLdoQfy9OXmM2uQgXf14qDHNY/fndMjXVgA5
 SLTs/vKtVAmHEj+LDaPUz7MQayb+FsTw++mcDcIv9o4NxTbjBlKWzpJ44oEgsyjSIIK62bhzh
 KT4Moj40FAr5P/CpK1md5pXVZFZ1lwM9sJTQdpBS2ceOYzdNJSw81m0OH0GkVMFZIHXc/luYC
 bz11okvLAFp86UG299TvYuUV5yQvke7l3QiRPUHW1IlzqhAnCcF2RoArxQrK/7vQrXk3vVZre
 bCqtW/FhrWxX+B4QCftEhURFppeeCO6RcJvdxf6IPofnbDhFf7AdF+xH5sWOn1g/yOy90wnqt
 7317qQCL6pCsqTyZPjuTS1RDKQo4Jm08lJATcAS1rS2mCXDPTCVJnqLEDpE9XXNQb60XF6tyK
 PyMW6OEbrQCVQVkzljrGRtvOoGq89JHm7pbZjozDkf9RVZvBXeAd2IN/HigaGcEw7s0QQcQfP
 YMJAOFle7X+xwN3QzbbrAK7/z+tNuyUSaeHa4fEq5qimvQTjkQv4IhuDyo84Dn68OknqVJ30R
 N2Dgj5RYnjP83ri7xi/7IQcTvAAvm13iDoq9V4ikikxvEasuEzLrcluOUkEvv9uWSS/Z8/DOW
 YoGdj9qmUPRO1iU1DECYs6IocrqYbVKQ8qvKIeYS7TSSSY6FP0bzJlQX+WkjyBsj8v9IHcz+o
 mLJCI1Ah0RRqKsWTpi3V0R63v/yhNwnSH1yk24vsyPJINaZsxiRC+Un8hkJogf8BnYM4mpfQ/
 QL16KZxfBoZwqxVuJ0A/taaXzh0z92rDLNKGYwALJgc38MT/hB0FkAG5fw9+Tqpog66qF7gVq
 M/7DRDQmu0oBMBmhKRyNPFFVBOhC8fDxjsYOdIIg4AjRtfeJekL1VZCidpQec6Jpr1iixFlKY
 v9brUqFPPV7uGLNYWUYyYKS+0X0ep6M6ZMS68t0FRgP83bXMxjDtjo1nFuYb/vNUw9F0f18uA
 gK8ZU0fTxJoyzq/guQlDMRTPGXiEnG8yvGG8h0YdvWcILQm/ng+nqgQW68/81VQs3jxstfNHE
 oKeXQXb4UP3y+sopbJBWLPAjYz/F8FrO3kuHcivTGLO3Q85N33t6haNNM3/JDcN2GMGaqVzsB
 ZSuoHHOFgj/fe9MTZOY5QlSrfO2UcLcFyd9MwQWd4ANkuRCPqR9MkLYcOmsJl2fxTgU3x3vpm
 LI2jWF/qpCt9DhbcS3zKg34PfDjyKy8mlHh9zXdY5bIGdPSDLZGM1/I+G+YHdsq+8qoDqGaDu
 JYawXiuAVqaI84pZYgHnvrZKgEg0FonjA39BK8f4u0hBb5XKkc1QbzYE3FeYyGnLUnrmqE/Lx
 L2QsaRyvLceh6uiE30wv39kPkP2g29jxAw3int9szijpOcgflJHs03mHNzuK16PCYIKBOGEBx
 mvRQHMW2cXRDb/of4SNkECeieJuIAkkOaTTGJAilmlL9ocdC1vtHEo4FgWdfhhFGCB2ydbNrM
 SM+9v7xIq5XMus27z5bj+ulpHDmOKUE/tFfFsc0PsWZU7eajmxATRq70bs7SeZswWx4qZWkX1
 uTX4vxiJ6ahAnXMnrskIN0+pIOtrcH4VYlXtdEufLsOVKb+mfbQqMYEh75WvfUV5HhZjVfk+J
 SHCVZz66y7bX4+2Mnho6Oj2d6O97EYRMevN3TXPsRx7f4oS0Ta+tOGoYrxMPKf2Y0Mp44+8Cc
 IxUL1kiCE1+geJGCa/GwdxLo4j7hgg7VWpgpFdNIAzKQAI+L/gCLWkGUcwbzNitwmiEyVFHJd
 3ezePEfVFA2eJ4hUnUGnm+pxDzZndAkbAvpWII1A0SwCS/fSjbp+Btlr41/J3KeXfB+4dlX2X
 d2tiznydV+P3uxwIkS6VXVULbseCzdnNZ7nyLbmUczAUY4AfUah55+Kew8JqQAbRGIIbvDsOG
 8EbXSbe+80syMmGpi11lEqxmRTQ0cPze80xgYh7LQMmLBRPbZlm3ILXuroQAOV1mfoB6UXQfK
 /A257NBKNR/n7S534bs/Q+iwnXMy1Lwmtu9Yq1l9PM8iE5BCr8FIZcSbHG7Ud1mnWC9lPgGV+
 5d1nf4hu6YivTsvOZAznY7kZpIBTRDYPtQV4ydHe0vUz2WjEO74XvpiO3t9o7SKW51Xiq91fW
 vwRM5P2h7BKdHixeC0ZcYBEmJiQmVIQcANor69QWASRXXZMHR5E/qmz1++h5QnHHOh9yQXsgH
 zTDIwNhBD1/ko2Fu6cqu3+QYNmvi4aDornm+3Oy+Z1GrE/yGpFB4pMcoen8fyxDgxMuiMWody
 Pg3U3fKb73wfTfefriQeFCgdED5De0esgFpGVTXXXR/etm/d/JMWT0ugVQf96QT0r4fYwccn0
 Vb

Am 31.03.26 um 11:44 schrieb Ilpo J=C3=A4rvinen:

> On Sat, 14 Mar 2026, Armin Wolf wrote:
>
>> Use the new buffer-based WMI API to also support ACPI firmware
>> implementations that do not use ACPI buffers for the descriptor.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   .../platform/x86/dell/dell-wmi-descriptor.c   | 94 +++++++++---------=
-
>>   1 file changed, 47 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/=
platform/x86/dell/dell-wmi-descriptor.c
>> index c2a180202719..fe42eb8bbd79 100644
>> --- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
>> +++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
>> @@ -7,7 +7,7 @@
>>  =20
>>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>  =20
>> -#include <linux/acpi.h>
>> +#include <linux/compiler_attributes.h>
>>   #include <linux/list.h>
>>   #include <linux/module.h>
>>   #include <linux/wmi.h>
>> @@ -15,6 +15,24 @@
>>  =20
>>   #define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF549=
2"
>>  =20
>> +/*
>> + * Descriptor buffer is 128 byte long and contains:
>> + *
>> + *       Name             Offset  Length  Value
>> + * Vendor Signature          0       4    "DELL"
>> + * Object Signature          4       4    " WMI"
>> + * WMI Interface Version     8       4    <version>
>> + * WMI buffer length        12       4    <length>
>> + * WMI hotfix number        16       4    <hotfix>
>> + */
>> +struct descriptor {
>> +	char vendor_signature[4];
>> +	char object_signature[4];
>> +	__le32 interface_version;
>> +	__le32 buffer_length;
>> +	__le32 hotfix_number;
>> +} __packed;
>> +
>>   struct descriptor_priv {
>>   	struct list_head list;
>>   	u32 interface_version;
>> @@ -88,76 +106,58 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
>>   }
>>   EXPORT_SYMBOL_GPL(dell_wmi_get_hotfix);
>>  =20
>> -/*
>> - * Descriptor buffer is 128 byte long and contains:
>> - *
>> - *       Name             Offset  Length  Value
>> - * Vendor Signature          0       4    "DELL"
>> - * Object Signature          4       4    " WMI"
>> - * WMI Interface Version     8       4    <version>
>> - * WMI buffer length        12       4    <length>
>> - * WMI hotfix number        16       4    <hotfix>
>> - */
>> -static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
>> -				     const void *context)
>> +static int dell_wmi_descriptor_probe(struct wmi_device *wdev, const vo=
id *context)
>>   {
>> -	union acpi_object *obj =3D NULL;
>>   	struct descriptor_priv *priv;
>> -	u32 *buffer;
>> +	struct wmi_buffer buffer;
>> +	struct descriptor *desc;
>>   	int ret;
>>  =20
>> -	obj =3D wmidev_block_query(wdev, 0);
>> -	if (!obj) {
>> -		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
>> -		ret =3D -EIO;
>> -		goto out;
>> -	}
>> +	ret =3D wmidev_query_block(wdev, 0, &buffer);
>> +	if (ret < 0)
>> +		return ret;
>>  =20
>> -	if (obj->type !=3D ACPI_TYPE_BUFFER) {
>> -		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
>> +	if (buffer.length < sizeof(*desc)) {
> Hi again,
>
> Thinking some more of this...
>
> Since many of these drivers will need to do this size check and assign
> into some variable that is different from the one passed to
> wmidev_query_block(), would it make sense to move those into generic cod=
e?
> It probably requires a macro so you'd have access to type information.

You mean something like wmidev_block_query_sized(wdev, instance, size)?

Personally i see little benefit in having the assignment handled by a macr=
o.

Thanks,
Armin Wolf

