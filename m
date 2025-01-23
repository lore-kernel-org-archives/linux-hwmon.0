Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E4BA934;
	Thu, 23 Jan 2025 01:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737596233; cv=none; b=qTgkqsJfiMFIt+V/oQZi5LduMSRiTIjRBNtCdCWHox8OTnOebAGAT//3ymTzVPXZ9zLGD1HoIYYbADrEPJbUGLgjZdSEy5CztKz4plGrH1eI5gHXYjDL3Y4GCnvYLzHwIICyCDjYyfM+SGaVt8AqazxlxPkBIzSV8B2vQs/HzaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737596233; c=relaxed/simple;
	bh=R3MZYeABGL3E+RFKLwnlc3KbLcqtk+1rUWH8LpZ9r+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjN3GecoLpnEnOJ3OzvxPNf7ouf7GgfgZwKVrmhZvbnVSwzERId25E+Et2LY+elbXoHJkImLU6c6DERKy5LZbmf637FmVN7YXjihhNfFiOe3CsGlr+UnZbtj+cvUoPmlSX29uvX5a6clY27K/X0gfZhKC8eTYeSjo64WrO9T4B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oT29FEWC; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oT29FEWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=lJizl
	fxCzvwAo8wJrUMUieSE/uUk7hN1vO+ztOQwL+4=; b=oT29FEWCK4Yd3c5ybdRQw
	Yl1lli8vyCvDbf4gL2+JFA+1vn5iIsVYlVpn3rhYToCl6UA0Yko9H3oG9Bephjxo
	0xKjYuYa88Q8tWP3tZBJYJ9P7G3UdKgVLq/g0nGiwXE/AbwbkzOpsR4CYKXH++NI
	D3Nalp+7nwmO0payV0G1Ic=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDHb8AfnZFnIWmhHw--.34923S4;
	Thu, 23 Jan 2025 09:36:32 +0800 (CST)
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
Date: Thu, 23 Jan 2025 09:36:26 +0800
Message-ID: <20250123013626.1085859-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122-funky-beryl-whale-a8bcbb@krzk-bin>
References: <20250122-funky-beryl-whale-a8bcbb@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHb8AfnZFnIWmhHw--.34923S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1DAFWUWrWxKr4UWw4fAFb_yoWfAwb_ta
	1UAr4xur17XFsrKFsxGrsIyryfKw4xZr4rG34rJ3yfA39YvFWUurn5K395tw15W39agF1U
	Cwn8Aa42kr13ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUbtxhDUUUUU==
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiNQ-d02eRnNAFGQAAsS

At 2025-01-22 15:59:02, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
>On Wed, Jan 22, 2025 at 09:29:39AM +0800, Wenliang Yan wrote:
>> Add the sq52206 compatible to the ina2xx.yaml
>> 
>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>> ---
>> 
>> Add the meaning of 'shunt-gain' in SQ52206.
>
>You already sent v3... and you got comment from me. You ignored both
>Conor and me, so me doing third time the same and expecting different
>results would be definition of insanity.
>
>Please read carefully submitting patches before posting new version.
>
>Best regards,
>Krzysztof

Sorry, I have received your comment and 'acked'. I was originally
planning to resend [PATCH v3 2/2], because I have not received a
response from Guenter Roeck<linux@roeck-us.net>. However, I forgot to
add 'RESEND' in the title. Thank you for your patient reply.
I apologize again.

Thanks,
Wenliang Yan

