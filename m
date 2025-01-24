Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1711DAC89;
	Fri, 24 Jan 2025 07:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737704795; cv=none; b=iY5WxFWncJ9fw731dgG85Z2kfbngaPcEp+AA6iMTWnRd0cNDXXQdfK1xVOLa+JcuJ5TBj5/ut+AhUFZWqqHFGCdhg6+pIArhLfZB9zXvccU3dKcMQ98ZeW5KARetlwn+QTc42YsswNnHD/6r1GBD26XTV/l8sPbIpQCQ40pFOWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737704795; c=relaxed/simple;
	bh=cseteJ21lJRWsn4XX5pIN/mh2cD1qlyYW9sQgksaxqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXWRmhpLs2rufQdrv/2erR6iU25a6JP9I3EXN8U+VVHDCwlt+MC3YGZrDjYhCHjizO2DjIqXxZTMY+G7/4svfATyTBUo23lTQ1Z/vVWRydJbf+I1ltqGXbbXU/pUuLSWd35xxlcon9qeO1vs41gbiCWghePSQnOm3kSte1KFMHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JY5jCBZD; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JY5jCBZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=fI1cS
	tXQRM2WY/YQ/xhEG8wvNBI+1K9iULvGCUlhyF8=; b=JY5jCBZDjANVRAkF8oypm
	ERiDBZTS/A5+/kg5VUDHWAek/TmTBsOFD1iuMzee7X+hWX8pPdaZ7o7ccYrUbX5r
	BN2y5/wufWFKWrazZ9pUfOFglBzC1Wznvw6jNW/D9hy1RDnNQQPAiy0Hm/LLdukd
	JlN8IcmdDaTtWyhT3WfjZs=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCniv6tRJNne1JNHw--.21374S4;
	Fri, 24 Jan 2025 15:43:42 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH v3 1/2] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Date: Fri, 24 Jan 2025 15:43:23 +0800
Message-ID: <20250124074323.1184274-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118-sparkling-spectral-mosquito-a5bc01@krzk-bin>
References: <20250118-sparkling-spectral-mosquito-a5bc01@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCniv6tRJNne1JNHw--.21374S4
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfU1yxRUUUUU
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiMADe02eTQHc22AAAsQ

At 2025-01-18 22:37:00, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
>On Fri, Jan 17, 2025 at 04:20:16PM +0800, Wenliang Yan wrote:
>> Add the sq52206 compatible to the ina2xx.yaml
>> 
>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>> ---
>> 
>> Add the meaning of 'shunt-gain' in SQ52206.
>> 
>
>Didn't you got an Ack from Conor already?
>
>Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
>Best regards,
>Krzysztof

Thank you for your 'ack'. 
I did not receive an Ack from Conor before.

Best regards,
Wenliang Yan

