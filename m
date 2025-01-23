Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E268B26AF5;
	Thu, 23 Jan 2025 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737619270; cv=none; b=P+5sBwWLfnXEPjWQAj6xME6Yt3SvSLfifquDp9ACV65+sPbp2HqfL2mCCgiEo5tDqfPYRpA2qA3cmTd4MuS4gV5gFig7vENKrRt77KaMOrthw2SOiuWruqBfMSc5AFB8a2IjRLxoiR6sF498L69PM8GMAf9hEwVriBPjAJBQp7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737619270; c=relaxed/simple;
	bh=lcYsCEpfujjplOGh05dnr/FrVbV2xk3xJMHLdrG3Twg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRs8tG3m4QvmmpVKIV5PU3Lvh3aqKKRKA6RN2ixZKNP3GyMwAHTO0DInDgV1hTVyxYbuY26WQ5MKxfg5mp7YdLKe+YKWP8hqd/04VfXiQdeeHF5k49kSGwLG+TdWve+hhxnD0djQ1eAyMVqiq5Y+qCPbQcu9R+UFMGXLxVuvx10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Hyh5BE2h; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Hyh5BE2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=ZKG0i
	gir4mFWmow2yjuKALw3vtyBOvdnOo2QP0afV7o=; b=Hyh5BE2hrz218+o3gTPkP
	7wlO9fHOMJxMRqkHZohtXlWOtiDlp54a+bvh6axNdynU25ErThrz1Ve6BnkmrC7o
	7n0iOlDfaz6BO31G8oqdECuQd2QCAbem9RhI6U93D9K8iD7U9g2szxiPcGLKTWg+
	769Mw28l55W8+/nyEcLLm0=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3P42Z9pFn_f9yHg--.56291S4;
	Thu, 23 Jan 2025 15:58:18 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH v3 1/2] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Date: Thu, 23 Jan 2025 15:58:02 +0800
Message-ID: <20250123075802.1105859-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0eda52b5-59c2-4ad2-bb2c-5846dbfbf3e9@roeck-us.net>
References: <0eda52b5-59c2-4ad2-bb2c-5846dbfbf3e9@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P42Z9pFn_f9yHg--.56291S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWxWw45JF4DCF15uryUJrb_yoW8AFyUpa
	4fKF1FkFWUJryayws2vr10v3Wjq3s5tFyrXrn8WryruFn0gw1SqFWY9ws09w1kXwsagrWa
	qa1jqas3Aa1DZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUL0ePUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiNQnd02eRqvTzgQABsp

At 2025-01-23 11:30:59, "Guenter Roeck" <linux@roeck-us.net> wrote:
>On 1/22/25 17:36, Wenliang Yan wrote:
>> At 2025-01-22 15:59:02, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
>>> On Wed, Jan 22, 2025 at 09:29:39AM +0800, Wenliang Yan wrote:
>>>> Add the sq52206 compatible to the ina2xx.yaml
>>>>
>>>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>>>> ---
>>>>
>>>> Add the meaning of 'shunt-gain' in SQ52206.
>>>
>>> You already sent v3... and you got comment from me. You ignored both
>>> Conor and me, so me doing third time the same and expecting different
>>> results would be definition of insanity.
>>>
>>> Please read carefully submitting patches before posting new version.
>>>
>>> Best regards,
>>> Krzysztof
>> 
>> Sorry, I have received your comment and 'acked'. I was originally
>> planning to resend [PATCH v3 2/2], because I have not received a
>> response from Guenter Roeck<linux@roeck-us.net>. However, I forgot to
>> add 'RESEND' in the title. Thank you for your patient reply.
>> I apologize again.
>> 
>
>A resend after just four days, plus dropping all Acks ? Are you serious ?
>
>Please keep in mind that not all of us are getting paid for doing this.
>If I am otherwise busy, it will take longer. Sometimes it will take
>much longer. If you resend a patches, they will end up at the tail
>of my review queue. If you drop Acks, expect me to dig it all up,
>and figure out on my own what if anything changed, the patches will
>end up even further down, as in "I'll look into this series if I have
>nothing else left to review".
>
>Guenter

Sorry for the inconvenience caused by my actions. I am just concerned that
you did not receive the email, and I will continue to wait for your review
and correction.

Best regards,
Wenliang Yan

