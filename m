Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AD524DFF9;
	Wed, 20 May 2026 02:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779244229; cv=none; b=FsKXQdJMfCWPuPj9bPz7h1JD3KvyViITLbZKC+NKCPyxM8u5GRuUOZd5eUyaQ54+V833TzP62jJzRWbbMq8BXMVjed6ptZmT6cAtbAP2xMZlGVIRopzoX/KL7JtUR0/AxAw4fCPnTN1DwdZ3XHtGbAtYjXMlaVCzYmZwkJHw+64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779244229; c=relaxed/simple;
	bh=umQySL/i+cwheVXxfAEP6UJDIKBClRPeT5TeOrqGCIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRAJ5wRXke0Z+Hg5/wLGP4FZr8P2DYSNjIinahK+t3dZNVyTj8Aqe53G+NLPKE3ChEfAKlu2mNgf0HkOLY+IDQBEnOXn0HCNfBjEsQsEira2dMYO3yMQPwlDMd3z0/PF5UG2eYtqPjoDQsXcJq2ZTbot3Ny4UxQmNQj0qhzh/ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XhZtIhVw; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XhZtIhVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Kh
	6jrTawrsOKTR3GpJla7SjL53Y2IcXzw55QN3iN+tM=; b=XhZtIhVwP5+c4FpkuG
	A/L8c0ml0UKRnRfq518OiqMmMrhjKfcJFE1MS98CdsZpRUJ0eR8D2BQ3+SjidHOe
	qgBAddKaD5LhexpEBOX4iwMERz66xn9UHkQT1fg6Ap0hqVveBPNiD+EYGTME3AWG
	4vAWIZQQHaHN9B//iM/wx6H/Y=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCH7QulHA1qB42DCQ--.11360S2;
	Wed, 20 May 2026 10:29:59 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean Ren <rh_king@163.com>
Subject: [PATCH v2 0/2] hwmon: (lenovo-ec-sensors): Fix EC signature validation and I/O resource management
Date: Wed, 20 May 2026 10:29:44 +0800
Message-ID: <20260520022946.17335-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514011411.4167069-1-rh_king@163.com>
References: <20260514011411.4167069-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCH7QulHA1qB42DCQ--.11360S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtrWUCw43tFyrCw1UXF45GFg_yoW8JF18pa
	yfWFs0krWDG34DXws7Aa42vF15Z3yfJFyUWr1UJw4fAFn8Xr1vvr48K3Wv9ryjk3yfX3Wa
	9ryUXFnavF1qva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRGYLgUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC3wgPvWoNHKjOSQAA3x

Hi Guenter,

This is v2 of the lenovo-ec-sensors fix series.

The original v1 [1] included a combined patch for both the EC signature
fix and the I/O resource conversion, along with other driver fixes.
Based on your feedback, this v2 makes the following changes:

- Dropped the "Fix NULL pointer dereference" patch (previously patch 2).
- Keep the original case of default case, remove the dev_err.

Patch 1 converts manual request_region()/release_region() calls to
devm_request_region(), eliminating a double-release on the probe error
path and a release-after-use window on module exit.

Patch 2 fixes the EC "MCHP" signature check that used && instead of ||,
which caused the validation to accept a non-Microchip EC if any single
byte of the expected 4-byte signature happened to match.

Both patches apply cleanly against v7.1-rc3 and pass checkpatch with
0 errors, 0 warnings.

[1] https://sashiko.dev/#/patchset/20260514011411.4167069-1-rh_king@163.com

Kean (2):
  hwmon: (lenovo-ec-sensors): Convert to devm_request_region()
  hwmon: (lenovo-ec-sensors): Fix EC "MCHP" signature validation logic

 drivers/hwmon/lenovo-ec-sensors.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

-- 
2.53.0

