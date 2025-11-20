Received: from puck.nether.net (puck.nether.net [204.42.254.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E4A1D555
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 02:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.42.254.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763604256; cv=none; b=bU9+3W67D13z16adCc3D/ArtDHuGnZ5hZ9K8FBmMhI51vVmIWkt+ZyGSKFG9xCVPIQOkopao/I1/h1/zo3L7BqG9A4/2AMdcFWlxrlwsApqKnfEh8JNpTSxPw8mMVzHOsmNQ8w8pnzktAlH49niricYbAJtIdI6eZveO91ihz3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763604256; c=relaxed/simple;
	bh=4LzkcNtUbZh4Xa4nj4dvKQIUhFfJuZ9k8bXMF+3dDWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tF7KvG2EQpuSAjb8VbQcDxkr6+MSw0tvzNAzR4RUNSkFxBYHCRsc80Ak0utJBzcqAQz3/fpMd4EJjM4wXGfqmqSaXitLjGygJRTcHyrxCTxMMzftvCMQB2luzeSbYQKKLHLPAv61ZKkN21uIruQI6lBkxNEoMfRFgrYjmXjyKxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=puck.nether.net; spf=pass smtp.mailfrom=puck.nether.net; dkim=pass (2048-bit key) header.d=puck.nether.net header.i=@puck.nether.net header.b=abnad5Pz; arc=none smtp.client-ip=204.42.254.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=puck.nether.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puck.nether.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puck.nether.net header.i=@puck.nether.net header.b="abnad5Pz"
Received: by puck.nether.net (Postfix, from userid 162)
	id EE487540034; Wed, 19 Nov 2025 21:03:30 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 puck.nether.net EE487540034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puck.nether.net;
	s=default; t=1763604210;
	bh=4LzkcNtUbZh4Xa4nj4dvKQIUhFfJuZ9k8bXMF+3dDWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abnad5PzhcVv8+0i9mhUxrK2McknXTYv8gVFf0vgfmm0j/L7LER2C6fk0sYggJvWo
	 7Gnp46cBPVSJFQmy+FZ1mdr74ieq1jujw0DiMaYtJczlitEKWfULw94I2KIoyUDjOD
	 V5YsMNVHJdyCLvI4nA+pRs+mho8KBcWte5kj9Kvw5+Hf25D3ryFEsARuvx/Cs6R4ff
	 6NERgLe6D8CpdVnbDyYGDaOAnhjRoRee6gGQDW9IewOnD0Ml2aRCIY3nVEOEAQGWPp
	 2rdlENQWeikfPlO8MoQNLARiqVpP3WklIrMe0u0gsSwoDmIkPv4Iv5R6AtKjEH/Ud3
	 rO6h66UCS1F0g==
Date: Wed, 19 Nov 2025 21:03:30 -0500
From: Jared Mauch <jared@puck.nether.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Jared Mauch <jared@puck.nether.net>, rydberg@bitmath.org,
	linux-hwmon@vger.kernel.org
Subject: Re: Patch: applesmc.c - update handling
Message-ID: <aR528iQGceJtE0nN@puck.nether.net>
References: <aR5W2K2Ic06uPgBy@puck.nether.net>
 <c5151e1f-cdf9-4d58-b00b-433f877b2ab3@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="HC4xSdcvwP0bHRYO"
Content-Disposition: inline
In-Reply-To: <c5151e1f-cdf9-4d58-b00b-433f877b2ab3@gmx.de>


--HC4xSdcvwP0bHRYO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

	oops, wrong attachment.

On Thu, Nov 20, 2025 at 12:54:24AM +0100, Armin Wolf wrote:
> Am 20.11.25 um 00:46 schrieb Jared Mauch:
> 
> > Updates code from hwmon_device_register to hwmon_device_register_with_info
> > 
> > Signed-off-by: Jared Mauch <jared@puck.nether.net>
> > 

--HC4xSdcvwP0bHRYO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=hwmon.diff

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index fc6d6a9053ce..10d1bfc6bf7b 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -1123,7 +1123,7 @@ static void applesmc_destroy_nodes(struct applesmc_node_group *groups)
 
 	for (grp = groups; grp->nodes; grp++) {
 		for (node = grp->nodes; node->sda.dev_attr.attr.name; node++)
-			sysfs_remove_file(&pdev->dev.kobj,
+			sysfs_remove_file(&hwmon_dev->kobj,
 					  &node->sda.dev_attr.attr);
 		kfree(grp->nodes);
 		grp->nodes = NULL;
@@ -1157,7 +1157,7 @@ static int applesmc_create_nodes(struct applesmc_node_group *groups, int num)
 			sysfs_attr_init(attr);
 			attr->name = node->name;
 			attr->mode = 0444 | (grp->store ? 0200 : 0);
-			ret = sysfs_create_file(&pdev->dev.kobj, attr);
+			ret = sysfs_create_file(&hwmon_dev->kobj, attr);
 			if (ret) {
 				attr->name = NULL;
 				goto out;
@@ -1338,9 +1338,16 @@ static int __init applesmc_init(void)
 	if (ret)
 		goto out_device;
 
+	/* Register hwmon device early so we can create sysfs files on it */
+	hwmon_dev = hwmon_device_register_with_info(&pdev->dev, "applesmc", NULL, NULL, NULL);
+	if (IS_ERR(hwmon_dev)) {
+		ret = PTR_ERR(hwmon_dev);
+		goto out_smcreg;
+	}
+
 	ret = applesmc_create_nodes(info_group, 1);
 	if (ret)
-		goto out_smcreg;
+		goto out_hwmon;
 
 	ret = applesmc_create_nodes(fan_group, smcreg.fan_count);
 	if (ret)
@@ -1362,17 +1369,10 @@ static int __init applesmc_init(void)
 	if (ret)
 		goto out_light_sysfs;
 
-	hwmon_dev = hwmon_device_register(&pdev->dev);
-	if (IS_ERR(hwmon_dev)) {
-		ret = PTR_ERR(hwmon_dev);
-		goto out_light_ledclass;
-	}
-
 	return 0;
 
-out_light_ledclass:
-	applesmc_release_key_backlight();
 out_light_sysfs:
+	applesmc_release_key_backlight();
 	applesmc_release_light_sensor();
 out_accelerometer:
 	applesmc_release_accelerometer();
@@ -1382,6 +1382,9 @@ static int __init applesmc_init(void)
 	applesmc_destroy_nodes(fan_group);
 out_info:
 	applesmc_destroy_nodes(info_group);
+out_hwmon:
+	if (!IS_ERR_OR_NULL(hwmon_dev))
+		hwmon_device_unregister(hwmon_dev);
 out_smcreg:
 	applesmc_destroy_smcreg();
 out_device:
@@ -1397,7 +1400,8 @@ static int __init applesmc_init(void)
 
 static void __exit applesmc_exit(void)
 {
-	hwmon_device_unregister(hwmon_dev);
+	if (!IS_ERR_OR_NULL(hwmon_dev))
+		hwmon_device_unregister(hwmon_dev);
 	applesmc_release_key_backlight();
 	applesmc_release_light_sensor();
 	applesmc_release_accelerometer();

--HC4xSdcvwP0bHRYO--
