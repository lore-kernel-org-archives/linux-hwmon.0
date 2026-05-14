Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59693C2B8B
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761177; cv=none; b=gJbDLgWBzd3PbndtI/Nuh9QEbzDhZ3ppQIq3hISjaiLchqGPPdDnDtCOsDhs+yfBIS+VODLzTHPcRIARiGiUAGWO100lGczGTT8Z04ifqWf14j3Jr6FNPl0SorsOJABfVxxc+kmkhavDaEig+ov3PFo/WcMUW/DW+rzAyzWt2MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761177; c=relaxed/simple;
	bh=3oPji8W/IpJ8TAbabdw/Hyh8vy5B3rvoKR9K+xB3h5c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SiVLU3jwkwWxx3GDdw152Hqr9HAy+XsBtPs2Hz2HVwFsC8JNV4dQpy+x5m95NGLu4znxmjqf1YyfLPmQvOkfJoWQ4P4wCKidcQdijxV1ofX/rQ49OSh5Y0rfYk9nISpIwIL4T7o1cma/dvkskpVwqIqAAHyLoVUCrSpu7t/fd9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6mumr++; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6mumr++"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7540EC2BCB3;
	Thu, 14 May 2026 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761177;
	bh=3oPji8W/IpJ8TAbabdw/Hyh8vy5B3rvoKR9K+xB3h5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=h6mumr++ZFQ9Nilji8Ft/zFIEr09hQneBiH2QqCjwCLvRgE4zszBfhTUaKpNrq5wD
	 JCbLQDW0T+0qUTx1mk+Jr2oAVe6ymOQkWlwQuySmz5OIL41o5zL3TT0/IoPc4hV59m
	 pfafIqkyZ6zoUOF5qGJDYmyj9uiqknWe49imhQ9CvV5QqujkIDj4yuwlGc6/Obm5+q
	 X1FK+3oIhyiwokzZprEjgVfgUgTupBXGWX+a1mRvagHy8/kd+b/wSTV7lHzc6Sn/Ta
	 yP/OOICbRO2Gosuvmm0Y4wOKO6BkC6gWNa0cGEWexRpbulpUqOB485GSo3Etquyu87
	 tl03hos+OKu+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: lenovo-ec-sensors: Use devm_request_region
 for automatic cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: Kean <rh_king@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260514011411.4167069-4-rh_king@163.com>
References: <20260514011411.4167069-4-rh_king@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 12:19:36 +0000
Message-Id: <20260514121937.7540EC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Commit message inaccurately claims to fix non-existent 'release-=
after-free' and 'leak' bugs.
--

commit 0f5c675a52c38754efb1c95225e331f855159802
Author: Kean <rh_king@163.com>

hwmon: lenovo-ec-sensors: Use devm_request_region for automatic cleanup

This patch replaces manual request_region and release_region calls with
devm_request_region. It delegates the I/O region lifetime management to
the device-managed framework.

> - A release-after-free in lenovo_ec_exit() where release_region()
>   was called after platform_device_unregister(), which has already
>   released the I/O region via the platform device removal path.

Is this description accurate? Looking at the original lenovo_ec_exit(),
release_region() was actually called before platform_device_unregister():

static void __exit lenovo_ec_exit(void)
{
    release_region(IO_REGION_START, IO_REGION_LENGTH);
    platform_device_unregister(lenovo_ec_sensors_platform_device);
    platform_driver_unregister(&lenovo_ec_sensors_platform_driver);
}

Additionally, platform_device_unregister() does not automatically free
manually requested I/O regions. Could the commit message be updated to
reflect the historical behavior?

> - Missing release_region() in lenovo_ec_probe() on the DMI match
>   failure path, which leaked the I/O region.

Did this path actually leak the I/O region? If the probe fails due to a
DMI match failure, the error propagates back up to lenovo_ec_init().

Looking at the original lenovo_ec_init() error handling:

if (IS_ERR(lenovo_ec_sensors_platform_device)) {
    release_region(IO_REGION_START, IO_REGION_LENGTH);
    return PTR_ERR(lenovo_ec_sensors_platform_device);
}

Since lenovo_ec_init() caught the ERR_PTR and correctly called
release_region(), it appears no leak occurred on this path. Is there
another path being referenced here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514011411.4167=
069-1-rh_king@163.com?part=3D3
