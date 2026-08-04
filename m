Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1737F439322;
	Tue,  4 Aug 2026 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785836912; cv=pass; b=gPoV+IHWibksGTK+yjZJ3BLW+qm6RFJJQZ8xhm9zpl9wUkVuAwMh+78sRI2309AFCqxWBDBkJF6J+zuHMnLWggxUNd8CxA7fCViu8sChypcO1S8VfIEziw1qLAAaSyIV87HFIjwlsvBaDGjJd9SVEGdnTgrd3xBJw8G5Cjl6vJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785836912; c=relaxed/simple;
	bh=AQq0e+kdfTcLcMt+42aHkstz1mro5WhY+PlNsVE8XZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6dcNHo+xgCO4MlvSBgswS+rCpIhN5H1L9Ums/L/nUKaliq2npqdRGX/vYr+67/M17IVlVAn8gPTWl60hahOaYZixp0ru7hM2L78lQySphWA4hOE0xRzSVSW7HPvFtlnzEctxidIZPFJ5ozYwN10mm9diHxXLuu73EJPTmX8Ns4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=q1QAa9VV; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="q1QAa9VV"
ARC-Seal: i=1; a=rsa-sha256; t=1785836887; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=hawap0FOGI8g8enA6465zPM1OIbkPTPkkDjttAYtBPXev92veGuLuHI0+EPHdrBop8wHuAju1Xe1bFbsoM6g7xYcEPfjy9OpsJsBP/3Qv/mfepqOj7W6lctfnVf78xtqv+f580qvC8BZjE4uZDfopGpjiEPZgIl3Kwhxqzq7/k4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785836887; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AQq0e+kdfTcLcMt+42aHkstz1mro5WhY+PlNsVE8XZs=; 
	b=B5JIddlGLMoQ4px701dCRAs08QGMSeP1iP1Vaah+7VFEL62SxAbSDZcu3+LHoU6Sl3d0iwp+lmH15m5KaD24b+X5z3ImkZEm69zuLEHPeb/1xtG6i+96Nbrg+6D6AsLKPiYoOUDFH8IBsU9ru6v/a1nHIKPNCkNWF8iMLr9+lEA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785836887;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AQq0e+kdfTcLcMt+42aHkstz1mro5WhY+PlNsVE8XZs=;
	b=q1QAa9VVTDDYvmr1NCCjv0tGXUpWINkAR6OCM7ESSi1dwQvgZCaMaUNd0rwNhZiZ
	b8kzRWylEjAB1v1gQhav84aPbE/huyKE25u2hbm1bAPP5DGerycfOx5sMcxIa/rKKp9
	BWkjrhNoN+weWMyRcQx/NoWWUSTpimJIeT0x6vHA=
Received: by mx.zoho.eu with SMTPS id 1785836883705156.6452590317731;
	Tue, 4 Aug 2026 11:48:03 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against hwmon
Date: Tue,  4 Aug 2026 09:47:53 +0000
Message-ID: <20260804094753.230500-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804061110.575adfc2@posteo.net>
References: <20260802123653.19532-1-ali@iusegentoo.com> <20260802145745.6f444fc2@posteo.net> <85f8ccd7-0d2a-43db-8690-cf220bd76e32@roeck-us.net> <20260804001347.164873-1-ali@iusegentoo.com> <ec30f5bb-48bc-485a-a7a6-953af65a66f5@roeck-us.net> <20260804061110.575adfc2@posteo.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Tue, 04 Aug 2026 04:11:11 +0000 Wilken Gottwalt wrote:
> I was playing with the idea to (1) remove the raw HID mode completely or
> (2) make the driver switchable, raw HID or normal HID, but not both at the
> same time.

Two different things are getting mixed together here, which may be why the
answers you got do not agree with each other.

->raw_event is not the userspace side. It is how the driver receives its
replies: corsairpsu_usb_cmd() sends the report and then blocks on
wait_completion, and corsairpsu_raw_event() is what fills cmd_buffer and
completes it. Take that away and no command ever returns.

The raw HID mode you can actually drop is HID_CONNECT_HIDRAW in
hid_hw_start(), which is what creates /dev/hidrawN. That one is allowed to
go: hid_connect() only refuses a device with no listeners if the driver has
no ->raw_event, and this driver has one.

Dropping it does not fix the cmd_buffer problem though, it only removes one
way to trigger it. The window is internal: usb_cmd() times out, the reply
arrives late anyway, the next command's reinit_completion() re-arms the
guard at the top of raw_event, and that stale reply is taken as the answer
to the new command. Nothing in userspace is needed for that.

One thing worth checking before going with (1): if your libhidapi tool uses
the hidraw backend it goes through /dev/hidrawN, so removing
HID_CONNECT_HIDRAW would take that tool's access away as well.
