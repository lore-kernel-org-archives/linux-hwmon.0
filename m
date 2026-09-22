Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC33955F0;
	Tue, 22 Sep 2026 02:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044329; cv=none; b=Qk30RRfo3zpZf4u3yHXDOCmLmlEQpYwqv5U5VGcQ6x6XADJF2hN7/SEGWSLGbIICR2PkDpxrLVqgcHk1IToL+VF3GzK0MAil48qip7cqKvRbI4t+HT+kbM1n7kVU2Ts/y2vlbejXl/eAnB6VyeDpZvQQk9YzoaFIE0Ho5X6F9+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044329; c=relaxed/simple;
	bh=2k9xMJD26etWKOfzn9yp8I9dceWxNIaD38ECFXHOQ9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ll8D803B5egJPYNYGRQX/yJ4I338KDiwAc43Oow+gynrpUcAocoGWpDpexlFbQAxGQmT2f5rjMqF2NlyoeCVb6T2bri01zfAeWBZDZjJp5hbucjXZ2CeJLMXbtcdPyQrQXAuXb0E7kKyg3HiAT4crUfQJxykhfDb6m4x1bPVQEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fn7TpeKE; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fn7TpeKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2k
	9xMJD26etWKOfzn9yp8I9dceWxNIaD38ECFXHOQ9o=; b=fn7TpeKERc4x7qUfJB
	monyoJiCbt0MSOk79Y4LYkjdzLyiNdkY4RG643CehnPlkQFnDwPoN/RAeqz5DBbO
	17B2+V+kznEN+kDF8U/0fTUVg84KQ+cNRmQNHzUqgeBgeAwfLbzTMQsfdNdHGeSJ
	nxOQZiqIlx4PmZovqZcZTKM70=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3_0dr6LFqwmEUAA--.8863S2;
	Tue, 22 Sep 2026 10:31:08 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean Ren <your-email@example.com>
Subject: Re: [PATCH 1/1] hwmon: (spd5118) support write protected devices
Date: Tue, 22 Sep 2026 10:31:00 +0800
Message-ID: <20260922023106.3078961-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1274727e-b41a-443b-9955-ac8119417edc@roeck-us.net>
References: <1274727e-b41a-443b-9955-ac8119417edc@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_0dr6LFqwmEUAA--.8863S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5PfHDUUUU
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC+wxcC2qx6Gx7GQAA3d

From: Kean Ren <your-email@example.com>

Hi Guenter,

Thanks for the review and for the detailed explanation. I agree that
read-only mode cannot be supported reliably if the BIOS can change the page
selector across suspend/resume, and that exposing only page 0 of the NVMEM
is not useful. I'll drop this patch.

Sorry for the noise.

Thanks,
Kean

