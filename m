Received: from out28-98.mail.aliyun.com (out28-98.mail.aliyun.com [115.124.28.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2ED329E79;
	Fri, 11 Sep 2026 01:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789089078; cv=none; b=Cj3gIdQxsYtKOqqnObrUc5QPpNHf4qe2yEuAMIJ250pCmM0daHA2Zy3ofpd85cDoOvljUt6EmUF9IZubyTMxm7ReBBDXjAm760yIeUyVkFS+spZNewdySkJB5hnKTNDXBl932J3Xhrvs2TnzyxRhDxekM+S4Y5drD+FePzNQtig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789089078; c=relaxed/simple;
	bh=k9TsElTaetFf3UocN9wK+Fef5TkF7gCWKtDt3niSy6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCWua2+8Z7HrzNUHmI235QsRuFWLeCM8Ijs2MfcBRPBF2ZgBW5devh29DSLAc1k/qdArTcorvAJlOQOxXOQDpglQK5nryDk9QsfLC+BIOJ+DAneaUTzV4kiiO2d9EmbUlU76UtKWviG311Y3Rli50ZFx+NKX8+xbrSRZBFJDXJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1644169|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0343909-0.0014939-0.964115;FP=12520856083731412865|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037021217;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jAuYSMz_1789089059;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jAuYSMz_1789089059 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 11 Sep 2026 09:11:03 +0800
Message-ID: <f4688c73-8d26-47ee-8609-8c73455e63f3@open-hieco.net>
Date: Fri, 11 Sep 2026 09:10:59 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] hwmon: (k10temp) Stop matching Hygon devices
To: Guenter Roeck <linux@roeck-us.net>
Cc: Borislav Petkov <bp@alien8.de>, Yazen Ghannam <yazen.ghannam@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, Clemens Ladisch <clemens@ladisch.de>,
 x86@kernel.org, linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-6-wanglin@open-hieco.net>
 <591be587-d6be-4fcb-bfeb-a92812e25b34@roeck-us.net>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <591be587-d6be-4fcb-bfeb-a92812e25b34@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/2026 8:52 AM, Guenter Roeck wrote:
>> Remove the Hygon PCI match and Family 0x18 branch. Hygon temperature
>> monitoring requires the Hygon node and SMN interfaces and will be added
>> separately.
>>
>> Signed-off-by: Lin Wang<wanglin@open-hieco.net>
> As reported by Sasjiko, the documentation should be updated as well.
> 
> Thanks,
> Guenter

Yes. I will remove the Hygon Dhyana entry and update the Family 18h
temperature sensor description in the next revision.

Thanks & Br,

Lin
