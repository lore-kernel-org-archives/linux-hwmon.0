Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0FC2874F5;
	Thu, 14 May 2026 01:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721238; cv=none; b=rVnW0xHa4I91ulXieuUC+cm/d6RM4T3T3bxdPg0gh/T7jiYrP2424hywaYxdX4mXLH6doXAK/JZCxbbAeZR4rn2pQprCHTiBUiqzsqO13NkK7gUkTqq9+7V/+yoKuMff+AiiQdLS4nrtu3nxdnCF7q+AWWE3EJHG7iasVFt5e+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721238; c=relaxed/simple;
	bh=0AfKVVs2Mtf3m7OghFSfiaLK/JFOuNpj5h5uwRHSLSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U3vt7TW5aVOVvM5ahaFrbq13iyNFBfS4Qo0nItxY6odJ9erZZAe8Veaeb2QmT+eAHMuS5JiTHChOPNKGROdksgPAYv/VboUBUll57mqgd95vmRvjZGaWFJtPsuUTSe6kopoNWM3r4EKIjjdHuLx0y/wp2IKCOhOdHVgVTDzamZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Q5AJWASg; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Q5AJWASg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ix
	XQUf7WxlqvghJviz8ABZk0RSuQnd2ukz42ipedT88=; b=Q5AJWASgxb4V9cMpyl
	Rf68AHUdVCG//xjOl6Q8YSN4FBCudniGGHPZY9YDmGeYXDQIDXwt676oh/9yy4Xg
	/sajR4d/baSBc7Jc1QLbgnzALbcceHrGtrG68OpBIHPqOLTejzWI3aZ353tJtGLY
	aL7zSo+uUBmDyZGWEVavSpXdQ=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3Hy+1IQVqnFYFBQ--.27803S2;
	Thu, 14 May 2026 09:13:26 +0800 (CST)
From: Kean <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean <rh_king@163.com>
Subject: [PATCH 0/3] hwmon: lenovo-ec-sensors: Probe error handling fixes
Date: Thu, 14 May 2026 09:14:08 +0800
Message-ID: <20260514011411.4167069-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Hy+1IQVqnFYFBQ--.27803S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFW3CF1UZr15tFyxZr1UJrb_yoWfZrX_ua
	y0ka47Xw1jqw15Ca12vF9IkrZxKFWj9r1xJF1vqFW3Cry7Xay7GFW0krn3ZryIgFW5trn5
	Jwn8ZFWfAw12qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRt-eO7UUUUU==
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC-BZRAGoFIbYXFQAA3B

This series fixes several bugs in the probe() error handling path of
the lenovo-ec-sensors driver found during code review.

Patch 1 fixes a logic error in the EC signature check where && was
used instead of ||, causing the signature verification to be
effectively bypassed.

Patch 2 adds a missing NULL pointer check for dmi_first_match(),
which can return NULL on unsupported platforms.

Patch 3 converts manual request_region()/release_region() to the
devm-managed variant, fixing a double-release and a resource leak
in the probe error paths.

Kean (3):
  hwmon: lenovo-ec-sensors: Fix EC signature check logic in probe
  hwmon: lenovo-ec-sensors: Fix NULL pointer dereference when DMI match
    fails
  hwmon: lenovo-ec-sensors: Use devm_request_region for automatic
    cleanup

 drivers/hwmon/lenovo-ec-sensors.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

-- 
2.47.3

