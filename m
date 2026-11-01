Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.64.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556131;
	b=UBaTEha7wI79tfwJDj7hw0bcBLJ3Ur3iyT5F2hX+L++T6NKJwh7r5V18xh8YL1VQUbQ6
	 TANm1UJ+YvbN5Hz7EPUZbsE1AZZRMdZ2bdrkpQMHsVNsWhSJW+hRVOa//IbA+lkJTjSaq
	 dWIXav1j8SN8tzNL3FX5Er6nLfCJGr97vj++MdAS41ltzcoat7ULcqIwPUf+p9VwrzRXQ
	 4mF+KdIewXb16PAttOlFqJtcMXiRT1R8zjH/jfsCo53SbiVBzSD/OdNy/Bsv3GB7P25sl
	 +KFC3VRMDLj7sWJY7FA9/lpDnzoGhSQHjbCSAT3BSM5veaCXJiBzE+NGYUhn6RiQEqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556131;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:X-Proofpoint-GUID:X-JNJ;
	bh=Go0vgQixrlIvwWGOI2mg7rY8Ni9A0LnfNhEK2C3rBuI=;
	b=DnAURgtwjmXpUTh+XfCa+pwMDEEKnZ/idSc9qUzik8Z7bWvS3uLVkv1OaPpDh+lhpa8z
	 mUThycnHdzoPqfjIjMeXcgTcwueuJxmhl4ZUwBwO7luZKncZmhNmKMf93qA8hFx6wzsWi
	 c1++T/h0xJPsRzax2CUV+bLVNyy5lXPkVoq3SrNZl6PU77BD1zzOY64/vRW+mM2/krrcj
	 qXCD5lVNgf7bUS/u3NDtbexj0R0ZMOOtYB0Dfyrh8TynKWhRzPyOrRx4uoB0jMxWGzO7j
	 +4Bc5H8HSO6quRQ2+0fS+pwqJdzm55U1kMyy5gBtJGsFsKjpQMF4eGrCAnH4zswPa3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=damex.org;
	spf=pass smtp.mailfrom=damex.org;
	dkim=pass header.d=damex.org header.i=@damex.org header.a=rsa-sha256 header.s=sig1 header.b=peR3t7qt;
	arc=none smtp.remote-ip=57.103.64.152
Received: from outbound.pv.icloud.com (pv-2002k-snip4-1.eps.apple.com [57.103.64.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFDB606A325
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 18:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFDB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=damex.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=damex.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=damex.org header.i=@damex.org header.a=rsa-sha256 header.s=sig1 header.b=peR3t7qt
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-5 (Postfix) with ESMTPS id C826E1800955;
	Sun, 01 Nov 2026 18:02:07 +0000 (UTC)
X-ICL-RepId: 01a19846-9fcf-75d5-a7fc-9e01a745205b
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhMHV8EWRxBDE0dXBcOVk1LF14MWStWEVQdS0NYGVVQXxwOCVYGVwgXF0EKFxlRTQ5YWwhbBA8fTAxRAkIFVl5JDh0EVAddBV1WUAJaS0IES0VoXAVcHEAXSB1faktWFAQcUgBSExwfSx8TAF4PD0wJSwNYAg1UFBQcA1wCRgZICEgeVVVTU10PTwtVBVpUEQ8cUA53D1MdXAAdAkUMDFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=damex.org; s=sig1; t=1793556129; x=1825092129; bh=Go0vgQixrlIvwWGOI2mg7rY8Ni9A0LnfNhEK2C3rBuI=; h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type:x-icloud-hme; b=peR3t7qtS29CElIdi4t0ByBERT3s11mhd9b9atSn20sBWApv495b/rjAcJFLTfhRNLXTjbjcFmbcdkbY8gXSUa19Syf9ikFtNeyy88napD/DpBs+8J/p9CyOqBDCrS4+SWdv5ztmEZvo+QAvsraXUp+9VVJ+o+N80ZEsakaYOFNIMb7YeEIxwwPWqhytRY7WxwR2e1Ll9dJ6/wdCv6CMBn2kCFgQZY+uLPr/LriLOF9sWRgEyQ+uKSCsx3adjwm3v5pEFhJvRJ+MeCYxhfyCPj6dcCzpppci3fLO68Vb6JuGA6WlO151Mmc+3RVe4tNjBin3sJs3Wv+PUPoLym0TTg==
mail-alias-created-date: 1762459955661
Received: from [10.12.209.253] (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-5 (Postfix) with ESMTPSA id 8498A180097C;
	Sun, 01 Nov 2026 18:02:05 +0000 (UTC)
Message-ID: <03055ffd-d015-4810-8b8a-678821fa6dcc@damex.org>
Date: Mon, 2 Nov 2026 01:02:02 +0700
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-hwmon@vger.kernel.org, netdev@vger.kernel.org
Cc: robert.marko@sartura.hr, luka.perkov@sartura.hr, linux@roeck-us.net,
 o.rempel@pengutronix.de, kory.maincent@bootlin.com
From: Roman Kuzmitskii <roman@damex.org>
Subject: [RFC] hwmon: (tps23861) PSE-PD support, extend hwmon driver or move
 to pse-pd?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MSBTYWx0ZWRfX29RmuVEedYbM
 aw5G8JYN1HOsjNWl6i8ZckcFhOyzWY2jcN06aOIOhH5XssA8L00Dus7AHrRCjuGEu/faf3tgg1z
 5aM7JmsxwJp2v0qz6yHkC1n/fJnPegt6oP6QRZTtSwnLOI5nQBeI7e8RcbMPLoazU6sfX3fsKlj
 viNA1ZKBzhVD0PyPhD+CW/kyYeiQYw9i/guNVGjo35wZePOn7LnwEHpGJTCgL/V4gcjjfedU71K
 Oy7a57ZxK6tEYw9ufepX8Ff1i/Lx2y+oyt7jOBc6AUpABDVHuiNf/QT3XX+pyS2zMnjpPXTCUww
 HTMt6m0pdU7tIIWDEfmwHkdJXAjz6T+K4vMDbj9/qqWFKD3aswYE7xNmUnB00k=
X-Proofpoint-ORIG-GUID: D4HnDuayFh6tlQZLiKfCrOlYwfAxX5VX
X-Authority-Info-Out: v=2.4 cv=RofI7SmK c=1 sm=1 tr=0 ts=6ae77ea0
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=UuZIIuYS88Jd6fZmK9IA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: D4HnDuayFh6tlQZLiKfCrOlYwfAxX5VX
X-JNJ: AAAAAAAB3UZu4E1nN6oDWq12J+JbBkeISoyGsoXHniuJoAYf45qYRI+85CB2IQJGFtuRnp
 UOTnJkpsvzldo+zPvGSSiB2eVZLHLKo4RoW6sGEQ787NVn6N/HAAzeZIWZPYCoqrNMtRIU
 tUqguvL7dfW7X5vuow2K7gSEurKSFPeKS8+WL/dX4CVzevM+szpNgF55O0oCouCKIxPdXk
 dnc+NXSPzIlTfS6MJw+cuBf61YDtSTSeqcEE2hWVZZJSRL13nFl0C/lEOHdRjLsGNy+M0/
 bI11OAFRgmEMDri05pcLnPWIYFYTCn6DBiqjBxHDVdlToq+DyPqUql8OjqrfxjCXjNWlRJ
 fjxcnEYg51Fw2Sh124rfUKSAvAlnf7GOGPhmisfAE12VhaevZryaO+y4a97E7kUHZjkUrw
 KBnVMF7DvD3AsfxwiKfP+5h3iwyNIzsKolI5Q8mNvD0sa4sobWIormq63+DBuYmd4wKS+e
 9rmOTbEz8U7zXZcA8ICjMwZ5ZbN1bQVegUVN0dtZl2BZSFoWcb25vU3YoGFV69Ld2wtZ+j
 SaMQdBYcmMVMQoZJH5L42IQUVzgn61ZWMBp/oG3ekiyOrCyNiU9yhC0m5c0K472TpbKY8w
 ym0SZ9h8p7R0Z5pxWzWMcWSeRJYmMR6RBQzbGA1B1Y2jTO1SJewJooSSJ2Uo0K9IMv5103
 IBK2eRaSbFQC6OXK/fJNHl32YX6GAFoj99QRf6JTee9k4S5MpuuwjLpNFnclIpvENYPF1O
 gc/T9hp1AHOqZkmPZ9o0p9BClEorpfQ2Ttsotl5hxbP4nkA9sQDh3lkrAfDHXTr/VayGGj
 IA2X4tulAGnMit5m+cB1w4y/J41aMyljR8Ib1HYyklUo78DaCBr82jxNpCjPgoGQoksExm
 l2vz3JHcVo+ArSwc5HMDLTX4Yksd5S9asNQBzNmWy5HMPLzppmY7gu1kDe7XGhGIpSB82r
 YwvAo+OWLle2AvUxPhlQAPJaZRkNnjvKT3w2wL4bg3q/VOn0uFnXkF4qsDgmGfn02iOAG2
 mRsFYVbj/wsL7QZBtcsRPa6TKXz0X7BqqDvh5/zrVTXvB1iPzu23+6WzGfcgLSVNI+M/0x
 QW2IZLk1bH/QOOyTqld1TUr8ik3cwMHp+pH3QsG2Z8Sfoa0u6TCMD0YrMGPYaJXSqDFWOL
 0UPVFTCEgA3RG2zpW+nKQq0oiIcw5wylBEiuxYeaJSOPyHLi5Z/USpXfJjhmwrBUCU1LXV
 7NcbjdDQo4b3sQPLPxIAJMXN0M3WCsflx1MyUYH0of8MM52VJZPKCgNECCo7ewre6w5xJv
 FCAWUTCFSJEg9cAK+t9DALJPGta1tnTrW8izF1l2RRxsu9iLvH0O/0Q+0=

hi,

TP-Link TL-SG2210P v3 (realtek rtl838x, openwrt) has two tps23861 for PoE.
driver is hwmon only. ports can be enabled via in*_enable sysfs, rest is 
only reachable by poking i2c directly.
i would like to control them through PSE-PD instead (ethtool --set-pse).

i made patch for openwrt which registers pse_controller_dev from hwmon 
driver when node has pse-pis.
it does c33 admin state, power status, enable/disable, voltage and power 
class.
events are polled.
only ports with pse-pi node go to auto mode, and in*_enable is hidden 
while PSE is registered.
https://github.com/openwrt/openwrt/pull/26330 (tested on openwrt 6.18 
kernel)

openwrt reviewers asked me to check with you first which way you prefer:
1. extend hwmon driver with PSE-PD (like it is done right now)
2. move driver to drivers/net/pse-pd and extend it with PSE-PD
3. something else

thanks,
Roman
