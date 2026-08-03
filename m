Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C89718DB26;
	Tue,  4 Aug 2026 00:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785802480; cv=pass; b=B5bvadF33GWBj8ewsd3v+iYNSMkvFbVR7s6pVJkP8c6ymP07uwkX3FN1ho/3IGDjn1dZw648TQAnQw1xLM9j/BdQvG5H4p5YaMmHvSpn52VHP8t4oc3PBZc9HjdUjjxN9euu4f/Hcdi/1vXgpMHNx+KIeLg75iqx3wj3eMmR/XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785802480; c=relaxed/simple;
	bh=99VrsUfYqU9LlAYyeB0la/+DrLszy+AMLK745oCjw3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0cvtgj5hbBUw6wbLRaIRl9Z80sXsu4h/jfx8k7Eb5cJ5JqnZwAeIEkpPT9K0bM7ELktgV27l4ufxK3gIzN881YkUFJ3Vg+QOcDAHusurqY2QA3fx90KXkMaJLFTuIuPb63/ZWiHDs7fmfbcm5zZeYJ+Nt48yA5HsFLPsidzbhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=gPUz465/; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="gPUz465/"
ARC-Seal: i=1; a=rsa-sha256; t=1785802441; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=XCM3/gLIKhGJiHUcsKnzDfpSVuSMpawakhbiNVXi0rmX+zvbXkV6sih5egmevQdx3hT9ynzKmr2a34BoUx4KF1SPFFf0gsx3HfOeeVMkZb3symH8/38+zomXT+92Mkz6yyDBVd6q74pkUqZDiluhaapNNjz4VItpdS0n0N5qfg4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785802441; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=99VrsUfYqU9LlAYyeB0la/+DrLszy+AMLK745oCjw3M=; 
	b=BGevmFbViMaK3sk1G5He65XeyocCb6pB7hYVc4v1sqcXNFO1kBHHx1v7MkH4tQG1RpMlcaOi+/qp5sjDnquTanM5FlfbGeEhP3GtBZHov+zloVYlvr+I9Cl/omboh5Hj3ZhDm848XzryMKt0dbu0XWfcymkuYH7kDbRHMqcxzes=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785802440;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=99VrsUfYqU9LlAYyeB0la/+DrLszy+AMLK745oCjw3M=;
	b=gPUz465/aYFnT1nNAliq10jPFZK63493OcblWWFjZfKsXvuFl2vxfWG8ykBTleXd
	5K+Kd7rFZC5pIvqYYfypaNHaNCiRE1qaQr+DskNFbSR4EFSugFJr1wgANpi937sTY0/
	2Vai8a1y/kOG01CUMn/IP4iu1mwtLtmtqI9cycL8=
Received: by mx.zoho.eu with SMTPS id 1785802437730138.5510837331044;
	Tue, 4 Aug 2026 02:13:57 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against hwmon
Date: Mon,  3 Aug 2026 23:56:03 +0000
Message-ID: <20260804001347.164873-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <85f8ccd7-0d2a-43db-8690-cf220bd76e32@roeck-us.net>
References: <20260802123653.19532-1-ali@iusegentoo.com> <20260802145745.6f444fc2@posteo.net> <85f8ccd7-0d2a-43db-8690-cf220bd76e32@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Mon, 3 Aug 2026 16:19:57 -0700 Guenter Roeck wrote:
> Anyway, I (and Sashiko) think the patch is incomplete. It does not protect
> cmd_buffer when handling raw events (while executing corsairpsu_raw_event).
> That is a pre-existing issue, though. Not sure if that should be fixed in a
> separate patch or with this one. Thoughts ?

Separate, I think, and not really by choice: it cannot use the same lock.
corsairpsu_raw_event() is reached from the URB completion handler,
hid_irq_in() -> hid_safe_input_report() -> hdrv->raw_event(), and
Documentation/driver-api/usb/URB.rst is blunt about that path ("NEVER SLEEP
IN A COMPLETION HANDLER"). So whatever protects cmd_buffer there cannot be
the hwmon mutex this patch relies on, and has to be its own mechanism rather
than an extension of this one.

The window I see is the timeout. corsairpsu_usb_cmd() gives up with
-ETIMEDOUT, but the device can still deliver that reply afterwards. The next
command calls reinit_completion(), which makes completion_done() false again,
so the guard at the top of raw_event no longer rejects the late reply: it
memcpys into cmd_buffer and completes the new waiter with the previous
command's data. The echo check only catches that when the two commands
differ. For two reads of the same command on different rails it does not,
which is the same wrong-rail symptom this patch is about, reached the other
way round.

The two also blame differently, for whatever that is worth: this patch is
4207069edbf0, while the raw_event side goes back to d115b51e0e56 ("hwmon:
add Corsair PSU HID controller driver").

Nobody has written the raw_event one as far as I know, so tell me which way
you want it: I can send it, or leave it to you. Same for this patch, if you
would rather use the version you already had sitting around.
