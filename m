Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92EA199C2
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Jun 2024 17:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719251188; cv=none; b=Xs7SjXsES7vLNPtG53f4KOyZ+Zv4qZseub6CTWXxZnjrJAhKsXcOs3cngenI9Mx3pMj+fJYa2oVLpr45jE4CWgXXRcQa3oadMeqNsnEb5R0j2LaLkVJcp8M6t9UOefEIggb4brTvuX5eTB/d3ndgVKxe1Yi3XBMV+gB1ikH4PX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719251188; c=relaxed/simple;
	bh=KJGCsFmhkqnxn3llCnTfuFfWP450qdCXSSwJxcawRIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bwD2ZQpyoSZNPT+5PzuJ3m9s4w4kupfvrNwxJylqWScEt0dTuX0pL65zKlN9hqJjABc6MtedfaSpB3Y9irp4SeP44nKiQqBL2TJ/YXWDN23j6eyTwYfODDu+HmTju25pvP83Na47F4VpJsqeqEo+4vUUnFsGoCDJlj6Zgb1uxXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ddbnn60w; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ddbnn60w"
X-Envelope-To: jic23@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1719251183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qRmcQBFuWsPTqKpm4FXHlkVwKO5dFEa8B7NhZYqTzuQ=;
	b=ddbnn60wckERqVd4VGyRRJrrKZfBhlCvFjLkdROpByRmeTigXeF/9c4dKbLOkcOAdC65DU
	vyltokkbZwTGs2t6x/DEzdPLHO+GVWy+96tsk4uVlStaRHnoSzQ//e7iucRLjxE9meKBj9
	cXkB2Pfg2FxAsKlNCtr4l6vQHWX0YN8=
X-Envelope-To: jdelvare@suse.com
X-Envelope-To: linux@roeck-us.net
X-Envelope-To: linux-iio@vger.kernel.org
X-Envelope-To: linux-hwmon@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: lars@metafoo.de
X-Envelope-To: sean.anderson@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Jonathan Cameron <jic23@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 0/2] hwmon: iio: Add labels
Date: Mon, 24 Jun 2024 13:45:59 -0400
Message-Id: <20240624174601.1527244-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add support for using IIO channel labels for HWMON labels.

Changes in v2:
- Check if the label exists before creating the attribute

Sean Anderson (2):
  iio: Add iio_read_channel_label to inkern API
  hwmon: iio: Add labels from IIO channels

 drivers/hwmon/iio_hwmon.c       | 45 +++++++++++++++++++++++++++++----
 drivers/iio/iio_core.h          |  4 +++
 drivers/iio/industrialio-core.c | 23 ++++++++++-------
 drivers/iio/inkern.c            |  6 +++++
 include/linux/iio/consumer.h    | 10 ++++++++
 5 files changed, 74 insertions(+), 14 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

