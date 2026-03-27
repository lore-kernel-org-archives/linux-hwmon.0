Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C13921EA;
	Fri, 27 Mar 2026 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644192; cv=none; b=hE39gYByil2cSR0mcGuRKmvcKt3NFTsBJmRo7xTa75eWHL4jnOkg5bs3MEHwqrRS2QRRiXI6ARLRo5E2f88h1off8IMwtAvUI0LpoIeJKbpzAvoi7V6wSEvB2p6Z7+G/eYRvXm/I/OpZi0gcgEvQmuVBMjoD/67xNvT8cmx9bt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644192; c=relaxed/simple;
	bh=lAskDI7O2EfZVPpVojwq82SKa/kUXbUveaAsopJ0nVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1Rhl0F8aRtLINwJohN0slMOTzdEM1oWsd+4jE2jwv0Q9UKKsSWDwB44WPvSMlv9mKByn3keoQst5Tvo2RcMRgsvaeTbOiabGWLEtXO1DdFbs+tkOdzCZ8FnmZboJohebR3mBUHPISlymSBE5m2strI6kneR1/fUK996lX8zzQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=d7wno400; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="d7wno400"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774644175; x=1775248975; i=w_armin@gmx.de;
	bh=lAskDI7O2EfZVPpVojwq82SKa/kUXbUveaAsopJ0nVw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=d7wno400sV0kMcYCVUWU+jbyw8CVeMXflPpdYbwYDszgUX+cofUbmqMkhVGJspQ1
	 6dsNa60+PEU9jH+ng4DVB1iwbUR5Jno6BgexR1PkOa009RHknQzU0dT47/SGvsXBT
	 ffxcq7g6icrMkahXBA6/PSBWH6f+t2L46W6x9m5y85m5nh5vyuhXZTY6ka4i4gU61
	 apKXf5+NZHN1NJMA5otAqO0w8q25Pqu+Hf/DOUAciurDxa7iPcM+lpiBiVcJ0vUg8
	 NiD6QsJqVN/Ycx5PR+p05UjihF9JX6Uh2gUKlBomR3imZCFQvBL2hu/cvhxDXNCxF
	 PeVdV7AbgRhFHfGmNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3siG-1vNzEU3gYK-00tL38; Fri, 27
 Mar 2026 21:42:54 +0100
Message-ID: <963779e0-92b9-45b5-9dc3-aa155f8ad9a6@gmx.de>
Date: Fri, 27 Mar 2026 21:42:52 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Convert most Dell WMI drivers to use the new
 buffer-based API
To: Guenter Roeck <linux@roeck-us.net>, Dell.Client.Kernel@dell.com,
 pali@kernel.org, mjg59@srcf.ucam.org
Cc: soyer@irl.hu, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
References: <20260314175249.16040-1-W_Armin@gmx.de>
 <502ea01b-e5e1-45a2-b5f8-ad236dc8f006@roeck-us.net>
 <52dabfaa-cb3c-4c2f-92a0-efaa175bf4be@gmx.de>
 <d491e41e-5a27-430e-b4b0-35b7e3867995@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <d491e41e-5a27-430e-b4b0-35b7e3867995@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ogg6G83Vz4h/KBxN4l9Deh5Ak+ysI6u1f/bA8wD6geKnB979zh7
 ca/cdZaoIMe6CbvmHQS1bmXuR7mKNtxWkQWs2LIoxL3IyVC3S+m5FLG8LJq68M8vxeeuBFM
 IpaDRYjBH+JgfnyR0Z/zuFq01dOG7i5PJsawKmXHeRezSFU9EGxhxbo2RQ1alMy6RazqXOD
 A323ZBdbVt6ieIhnEl97w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vcPNWVCHLZA=;pQS50goVwyk4ZE7dmclbpMUVm8/
 7cQwAvhLUH01mtgHUOD0rEOO3SkEg0gMPls9Ul12fwUuflBYDH1c09JycMTtkIg1kCMAPjuNv
 vDv7sPJk/sw2bu0/coRmatWlcLqtcjYUy92n+VB1KHHzoaYGPF2c3jMJCpku0MwbsGQjERnls
 1uEZ6PxgfvB7XpQ/rMEuZ2TlJs6m3+jNEA56YPUCXSJdCa+0F7VZhjhqkY6cFQZQBrVA3AkZP
 KtlWkROVqieddq8JVZXuQ7RIRBmGx8UEujJ6YHclhgmnYs5UBGBAlagx70tD+0Y3yH1ycMsus
 +ejgekfAV+tJFLWi8MGjvIwP3ubsNIJSDOYhBMleNGuxzRSBQuC5rEvt5x/EFoppNZ/4bzB2Z
 PvY+ImezMcEv8+8pmsmTy5Wm7tBPVkRaf6uaoEl5KqmXZ7uAson/OzvhlSW1taScvKayTf9dQ
 oZzoQD9gvaenWC7fLqJvCxevWDLfHGg5RptyCNFchehRmGy301fOtZ3M5MyGnKZTbQjc7fLn+
 SopqsJCBEtF39wDjRjgfY3vYsK7WayiCar/JL4U+4FUTJPchbDKfrqGlP8eL2ekfG+Bg7zwKk
 fu4u1Gsy6L7iYbQBr5MoaNHxHQDZftHaAaqM1dNags9I+WucJqlz5THR8LlWBisQn09tR8GSg
 Z55nQEnjTF+iy6uqHJpjbFzfxzpa0A2JqfBfnRjSs01mqNFqKmHEAfvFpJrbTnJMTaiheqJJv
 h/REGt/BsToNOkmXkszxZlGI7OEiVhN5JTppEMO2O7lGvDksKqQ4ftDlMP7ZxDK2VyMA21qSx
 e/qZS+Dd058lgd4lIx1xfFkuQPajzwa40IzqGAph9VBU3IJy+GlgYHwhgKyJPjLs9YoIsFA0J
 EmrMa9ippYNdzfZwruShGJRPUl34MU/LQeGGCRVergHgmOhbA9kjPVq8xpMtGbMQq1KrNHlxo
 pR8rBWKRTSZN+UE5oFOnl+nT1xbEigjep5D6MiSsnCheWYR4lJHLSJdNa0yu0DvVq7XLAJmfK
 gUZ9GRFyg4Yzod9Lk/AQsATw4MCvL1JHu4vrVZSgUwPbZecteT85dsMvejdBlQsGzMFUDzqaA
 PuuA2r5Ahtn8d74fR0FjE7Jl843jaFufublCamQAHTH1TameHpj2QJCpHsOViFYqh1WlOkPNP
 n/7qtXvLA38cuUdY4LgPYBdyLr0xChDprTVA+gRDlWhqus0DIjPg34BfN3spFmWXn+R9jgalt
 OO6ZkbYSmYytqUOpgxmI0gS3YaOq8CXHwQzOku3fL5ciICgNInHeqdJWrjf88NPvl6yW5Yx4V
 DbMRCa3Z0VvLM1Nw5+xa9p5iywp2HIOkPFVLTAT/RqAX71HC3b+x6B/yISn9DEqAIBeA0TIiB
 1UKILt+fPtHpi/vlVdF9PPpDz9Sd56fQVNFCt92X1brg2B17ZgN6WqU/4g0n60NpbXSus4YO0
 V36JRuNLrYr5/ONExkZOk7Jt6V0fFMFZFHttCtYrkYkJ32ictY0N993+x5hydEnLA7Qc3ivoy
 +1DjQDEiwsgnspFciJXva3P3ugnuglsFStftWWp/yRN6zLsrXAi3CAWZhDInMBQRd9hbPlSyp
 q5xRC9xioDUj+VJPnlTXcXxK45Pm+RQGzRI1hVgbFg+e5eEEYJPZhHz/1O209TmVE/0MrxCmK
 Gr2/d0ynEulcW9TGVznfrZlVSkpubPG45Q2+GHQZt/AHtiUsH+5VR5QiAoptftgMe4WCFQ9Ng
 1woUL4wAGkQEtOBW5ZkgyLK2kWcBuc6v0vxWRB7buQ/mAPnZPMBxrR6/ZGWETsx9NrLoiouyN
 +shahHX1QfuVmqbo+lG1s8O8C9s4AC5jhEGtmuFOnT1dzJoARaBWw0vWK7MiINGCh1Xzx7dk4
 pDSKpamJOtlAD2lLBqcrpijvMwaUCz4u2TswJ4U0l5pvn/qkB1d6SwwmJb6qFeLldvp7P7AZU
 7b2TGXOIZ1Nq5JJ1tmDJr+6jDkBUuIdqdm67r7XHKyxVFYcl4A6HvzSamyX4OHJGR7RBAd+1M
 N9lIFxLnJf5Tw+FytL3H5+apZUha6McGH+XSAwfSKVv+jjmH2w7JT5nhBLpXGc+4BN5Sy6VzC
 eApZzjOCOjDR1MC8K+zT7uDiOOZbY8/cCvjktNvzBJXwPHbpXBRi3p9ucOOAjQU6+qMDSIGd+
 qbSgTH6EFPMLliDupVSHVTrfPGwQMtsebXV7PHcaTDxHoQpDQ6fCsokqsLiGfcC80N0/tNafK
 dCTVmJkzudmn5MPFcQu2udniDlEqNl29ub8b1kRtJGZqd6g/D8qfnN5XAK6xCY8cNAi37rdl5
 p6Q9Jx1MxxMfrWcAy2xt/1vH9QijSZOevdwZGJimqSOL+x/dVR3AaqpRGxlreMp8OLMdJH6wD
 Croa9F69LGRu9HMLVLZdVdpQ5T0TOC9rP8/3aoQ3gg8h3VyvhaL9m3W6ERuMFasst7kRkwLLE
 p/XUfRLnBK09EBSzru5QlQM5wpYl23UUO207C1D94S42od1Pbl7eyuMQ3L8EvCTC+jD6SHhgz
 W1+96NLht0CQLQpMVQtklrCDfnElrVr+y0drzzUDOvA06w+YCviggFsrfbXiB30JZ+OerCE2R
 xTTeVZElsmVwZYJSATQjc7VSxJG1gixejhoKk4targ3xyCGqpZcGUhyj355KWRH2Rvn0xqrFI
 xjASRVpob225eUkHM5aRB+Y1gfRPb2g5Hlr9tBAkABUYJRv6Jn+lHVwJRWWywLNyJasx6zkEy
 EKpGIpxy1KvE0tf7MtB/nf8AOawCVWLzGmYFlEIDHNWAia9CEEZt+WAUPqnAJ0lXm7hr/woBM
 RdKQUvVCt2toU7PKqZ0aFSXI1RLr+6FcRq6puorf7nvHlLMHgESpBnZB55CtSF1MGjzfdx7yR
 VAW3M1ogYrfIZ8tb8DQ3Mpx0l7MWWHvRSU95DdtBxDXwHsH+JM0n5uT78+fVKuG1mJpwQ3Z53
 7Hz4oVoSXGVb00x16Ia+I0xdVTichZ+lh/VKkqo6gXjNDBSANs2Tqqd3j7PEIEEy0AXhXukgV
 wdZDQPo34GrbiqItXXlGbgeh+jxWH5RqvdFLss98vi1DYZpCDEOWalxlX68qr+zI7uvkIU7LC
 mmibMNOykJkFdewSbqW24KVG1En/UGJYsStQkXFvroeNCAXJyPAFTpsQkSPrfPEvqjFIuRPuN
 4eA+pzW49gVRj8zoi7Le5hsFb7neh0GgqkfP65nj5z3pntNWUAVZ3JxHW80+VC02awDnROwua
 2I+sWrJ0ZX726peQ9MV8irqvoIo17/TIrYMqmBAhOu7G4+2Kmr5+qK7488r1SzJkYblQXjJ8s
 L1zG1VmvTi66BVriOU54dxQ3spWfOUV+ZvrAg/3mChcVwRkfV8JanSgin0ro26pu4XdfcgSW0
 1eRX0/Lf3xiElI2gMCFm9o6owsAAH0X3jDwlrVIY7W6v5++Xkad87M3vbCA5cIom7f5T4ZYJD
 hkTaFvyqOTvjtEkFeNe4v5M25RDCTZPTLIoRbySiOZ3kHqY2IG4h6nlwMQbeaCn0FqXqN1Y1v
 fVcxem4ZO6CgM06pfVnIMIFsTusfXGBi6FFUtiOHB2w2IlyEfVgE15VcVVpEFwZdffava+gdW
 NyhBTEhuFlcSke15suq42EodmU/nKburjOhZG6Ws6O8jubznRjRVs4zxBnxdd4H4sI1YMCNz3
 nWBAI/ss46XpzKn2cRrvSrIzFFvodSN+orLYQtkRbJhApawNC2rLx5vR+5FcUlPst5oEsn6T6
 /bfvvpLuTFUKUot47iDrBMVg31PK6yHeTYpqPme0dCJHMlEtEwl/gipbUZ7OxGNlgitLcXrjg
 Gs+HTlkLIdm6+PVGKupc+no1hRTwXyZQtDuQ8V02Uduk3geRSwJGOjWnxEiXf54Y8qswJyyX2
 bB8O8jVYa4XZxiCvpXDmWJoQHFofF9UDELxjb0+dFupz8met9ww/+y8TcLq4SKarW5x8OKNQs
 PcIshiPn4lzKwgRD3x2ecJKiR594lkmmQdX9D8Ol3XdbGKPaX0S6uAr8Q6t7XaoqB5j4IssGc
 X/OA/gFOAmIdiu21xXexmnQfLb/VKnK77QlKCzgQNgvx9k15aRYL9Jq9zO+M0lQ9zXU2CczPg
 Vppurvnfl9dVBq0RCRXEJkF/mmiMd5CwLbG5cDCTWMP3CjdL4IKeddlJrBDydnuKKlXWS1BSN
 g1GNf8M33J+WsqTdvfFWVnZlu+jg7pHRQec81BEXhxNmbSrcjK7Mna7gQfIWKoGEHLamxOUl5
 DNbAGaEv8Pzx6DtIzkjk1wb8HXojiiBErRKyLp8VPsijA2vjPq0wJtgYjMziA1JNw7QtAz1Qb
 MQPw/peJGTqw04U6Ost5X/5CV84pwk7365QT2ffrOimE/OBjqvt/1klH7MJiQvuigXyMm9keO
 4QDm1MYoaHcjBhi68zWr7Qs5Xf28CtdA0+bp+NLmq12ruhrWRkw+Cpu4Bq+TnZDLY38gGN/RW
 9C3BfKBORRXozQABKQ8Ke34EgmafbWkShDwGtr46gkSZ0T9Ymx87Y+ohT9FSYIuS6sOTVvooT
 OosSfqeNxy1FTU8mfaAZYgfM2xNF+x91zcULWX6ha9eKOTr6hyyniNyc/Rcxz1vzAYeZifHnT
 8u3iU2JCbu4kJcYoe2AlKn6AqlSVZHNXICULbmsMje/GrgYVGglnZRzXwY1QbiE6stD2Pl88r
 VaHwBoUK626vgc28vFN66Zd/TnE5lOfXSVXUh6MmUvForvVASBg23HZnPcerM2maYeWIxJ/3E
 O+oP1KGYBn02Cz2YbNJgmhE4EHGvqzCm1gQYt5az8APzFoPUKDcehNv8N6l7cvO3K50TqI5Nq
 OB3g7DpLZa7aJnZbWp5vsUstQVfrTuuSiKIJc3og+xqW+Qo2vTwe7Xpt3pO5/SbQlJ4fEtoqH
 RKwW/+/RRe/zdMA6v7hZMZKRghGV5VxUYqjZmINrtcvkGS7xbrAhOdxKo25eIEEczQYvKHx01
 Nq/oH3e8XNefpjOQoK5e/AYolbYjZFpz6b+Ml8SHhZro4F5BxrKmmPFfsrPiw/6CFYsPjN13E
 LkTvFD2r3unf0iHqLN3MR8R7Lnkgu0w2BLLckS2/uGToIgIFaOLm4m2+Xxbh0zRMMQvhfLmWr
 ACDtK66LW/uyNafpmaBeEIfLUlxewO2zBLYNxvDuCS9ZJ5p0vN2hL/ko0rtNbea5Sbk3XZH1F
 vAiHyoek7HqgMfuvYZCil10WI1eCwmMAw2DW9dQ4GMdbGIsvFZ81OYf702PVncyEh+fzbu8xr
 kPXfP4kj+eOkfnYCJO6Pue7Qxn+zk7apB2HxAQ4FAg==

Am 17.03.26 um 21:22 schrieb Guenter Roeck:
> On 3/17/26 13:11, Armin Wolf wrote:
>> Am 17.03.26 um 16:52 schrieb Guenter Roeck:
>>
>>> On 3/14/26 10:52, Armin Wolf wrote:
>>>> The new buffer-based WMI API improves the compatibility between
>>>> different ACPI firmware implementations by performing marshalling/
>>>> unmarshalling of WMI buffers like the original Windows driver.
>>>>
>>>> Convert most Dell WMI drivers to use this new API. This also
>>>> removes all ACPI-related code from those drivers because the
>>>> new buffer-based WMI API uses abstract WMI buffer objects instead
>>>> of ACPI objects.
>>>>
>>>> All drivers have been tested on a Dell Inspiron 3505 and appear
>>>> to work normally.
>>>>
>>>> The last three patches contain some misc. cleanups for the WMI
>>>> driver core itself. The most important change is a fix for modprobe
>>>> to verify any WMI GUID strings from WMI drivers and convert them
>>>> to uppercase if necessary. This should fix autoloading for WMI
>>>> drivers that use WMI GUID strings with lowercase letters.
>>>>
>>>
>>> The series doesn't give hints to maintainers if the patches should be
>>> applied on a per-subsystem basis (i.e., are independent of each other)
>>> or if they need to be applied together. I Acked the hwmon patch,=20
>>> assuming
>>> that it will be applied through a common branch. If the patches are
>>> supposed to be applied in subsystem branches, please let me know.
>>>
>>> Thanks,
>>> Guenter=20
>>
>> I would prefer if the whole series was applied together on the=20
>> platform drivers tree.
>>
>=20
> Thanks for the clarification.
>=20
> Guenter
>

Is there still something to do for getting this series merged?

Thanks,
Armin Wolf
