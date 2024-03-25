Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3CF1C689B
	for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2024 04:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711342779; cv=none; b=FA0xY5nQd3PEo6rVlxU38vE4ZLUBzmT6DPoXd0y1JEFPkMY3zTzcXECLNPjRNutq/c01fb0Dq9UpyLf2v5BTZV3v++xulgx7oN/0U7hRSuREF2Jn2TgSR3LtU6JeefjOaoi6KUZFYVFB3TTZe2XMjSsQEqwEaypHLL1AP9iM7dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711342779; c=relaxed/simple;
	bh=OmByP/elzcFCGh8kjktcKYI4M39nhljTfb46nNsS9HQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JnyHouUtXPADHXGB3GfbaN55vLTO5bZBeVIic1XUnuMYHODQfoZHramS7jlmJx9e8lYbeqKQylM+guwlK6PqbZsOgephsSFWljQeSR5lYx0fnkk4vZeuDRhkwGimiz6rHTrCiJemIqus2QnUaq817l1ajBY21v3QGDlXn7p32kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UP6IULNA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UP6IULNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711342775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/V34UkdRqyZGwoke4yqoK5aiaYEDrq7lXzfCyAneutU=;
	b=UP6IULNAoluG5pa4AFLoJLyvJpq5w6b+7jRGVjMN42tS/IpFLaEy/jvbPLnm4K2GfgKqk4
	pUz8xl3/+mHg9jTrhiW+lSiEZ1eKCcKRaGXPNiq7rw21IZT/fA/DSz629BP9iNLB1wsGK0
	ihGwGEpyYeRkDZzAlhSmduPqoq8U2DQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-VK5V4dqHP9ahyJO_Y4Rl9Q-1; Mon, 25 Mar 2024 00:59:33 -0400
X-MC-Unique: VK5V4dqHP9ahyJO_Y4Rl9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9422101A586;
	Mon, 25 Mar 2024 04:59:32 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.64.240.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 719C61074E;
	Mon, 25 Mar 2024 04:59:31 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: pali@kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	snishika@redhat.com
Subject: [PATCH v2] hwmon: (dell-smm) Add Dell Precision 7540 to fan control whitelist
Date: Mon, 25 Mar 2024 13:59:13 +0900
Message-Id: <20240325045913.385853-2-snishika@redhat.com>
In-Reply-To: <20240325045913.385853-1-snishika@redhat.com>
References: <3f0d7398-401e-4e7d-9f48-0a6bc0034c28@roeck-us.net>
 <20240325045913.385853-1-snishika@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Add Precision 7540 to the fan control whitelist, in addition to 7510.

Signed-off-by: Seiji Nishikawa <snishika@redhat.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index efcf78673e74..0e12634e83cb 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1506,6 +1506,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
 	},
+	{
+		.ident = "Dell Precision 7540",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Precision 7540"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
+	},
 	{
 		.ident = "Dell XPS 13 7390",
 		.matches = {
-- 
2.44.0

