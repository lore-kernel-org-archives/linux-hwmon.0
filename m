Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6A91F8AC0
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Apr 2025 06:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745735588; cv=none; b=Obrpfz+1cZxhj50ykQe7o17pW8nMz1HrLO+VUjRPjttZxCuJBqoW0mYk6L5TuIyImoNt6Q/KBqUdTFDzV6x+PrAlpFZIvj3iKBVHIjA5rF5hEgvJ1rDHBipTupGq939gWbgAWoxssXHuuhuJZxjl2B2rRt3eaBP6HDBymnMCPZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745735588; c=relaxed/simple;
	bh=0NQJG3HJwKrg1IoMqJrBmx7B2B1iRkoqGTatcIR9y8c=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=qTDTz6bDJP1+fwd7PwbhForCXalqdjFwpjBCedh5IjykIoL/3kabbavI1VFilo0rE5IgcebbNwlOGjqjQN+yA78mbeod1IaRFMgKVhn3oA50vfdVmweb8Mw44e6PEpOj4jhFBL15hpT6E902oaaRtrW+nWu/YuMXVzde6R0L1YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZlcGp5R4Yz27gHJ;
	Sun, 27 Apr 2025 14:33:38 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id C5E661A016C;
	Sun, 27 Apr 2025 14:32:54 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sun, 27 Apr 2025 14:32:54 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 27 Apr
 2025 14:32:54 +0800
Message-ID: <1f8f24e8-0ca2-4fb0-bb69-21965e1c70c2@huawei.com>
Date: Sun, 27 Apr 2025 14:32:53 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>
From: "lihuisong (C)" <lihuisong@huawei.com>
Subject: Consultation on extending hwmon channel attributes number to 64
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemn100009.china.huawei.com (7.202.194.112)

Hi Guenter,

Currently, the implementation of hwmon core limits the maximum number of 
hwmon channel attributes is 32.
The maximum number of used attributes in hwmon.h is 31(namely, 
hwmon_power_attributes) .
Actually, we can extend this upper limit to 64 without any impact on 
driver. And the main modification is as follows.
It's also mentioned in series[1].
I want to know what do you think about this? I will drop this thing If 
it's not necessary to you.

/Huisong


[1]https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250121064519.18974-1-lihuisong@huawei.com/

-->

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 1688c210888a..6f3e92b67e74 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -785,19 +785,21 @@ int hwmon_notify_event(struct device *dev, enum 
hwmon_sensor_types type,
  }
  EXPORT_SYMBOL_GPL(hwmon_notify_event);

-static int hwmon_num_channel_attrs(const struct hwmon_channel_info *info)
+static int hwmon_num_channel_attrs(const struct hwmon_chip_info *chip,
+                                  const struct hwmon_channel_info *info)
  {
         int i, n;

         for (i = n = 0; info->config[i]; i++)
-               n += hweight32(info->config[i]);
+               n += chip->attribute_bit64 ? hweight64(info->config64[i]) :
+                               hweight32(info->config[i]);

         return n;
  }

  static int hwmon_genattrs(const void *drvdata,
                           struct attribute **attrs,
-                         const struct hwmon_ops *ops,
+                         const struct hwmon_chip_info *chip,
                           const struct hwmon_channel_info *info)
  {
         const char * const *templates;
@@ -811,7 +813,8 @@ static int hwmon_genattrs(const void *drvdata,
         template_size = __templates_size[info->type];

         for (i = 0; info->config[i]; i++) {
-               u32 attr_mask = info->config[i];
+               u64 attr_mask = chip->attribute_bit64 ?
+                                info->config64[i] : info->config[i];
                 u32 attr;

                 while (attr_mask) {
@@ -822,7 +825,7 @@ static int hwmon_genattrs(const void *drvdata,
                         if (attr >= template_size || !templates[attr])
                                 continue;       /* attribute is 
invisible */
                         a = hwmon_genattr(drvdata, info->type, attr, i,
-                                         templates[attr], ops);
+                                         templates[attr], chip->ops);
                         if (IS_ERR(a)) {
                                 if (PTR_ERR(a) != -ENOENT)
                                         return PTR_ERR(a);
@@ -841,7 +844,7 @@ __hwmon_create_attrs(const void *drvdata, const 
struct hwmon_chip_info *chip)
         struct attribute **attrs;

         for (i = 0; chip->info[i]; i++)
-               nattrs += hwmon_num_channel_attrs(chip->info[i]);
+               nattrs += hwmon_num_channel_attrs(chip, chip->info[i]);

         if (nattrs == 0)
                 return ERR_PTR(-EINVAL);
@@ -851,7 +854,7 @@ __hwmon_create_attrs(const void *drvdata, const 
struct hwmon_chip_info *chip)
                 return ERR_PTR(-ENOMEM);

         for (i = 0; chip->info[i]; i++) {
-               ret = hwmon_genattrs(drvdata, &attrs[aindex], chip->ops,
+               ret = hwmon_genattrs(drvdata, &attrs[aindex], chip,
                                      chip->info[i]);
                 if (ret < 0) {
                         hwmon_free_attrs(attrs);

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 3a63dff62d03..8634bc4bdd1c 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h

  /**
   * struct hwmon_ops - hwmon device operations
@@ -433,7 +433,10 @@ struct hwmon_ops {
   */
  struct hwmon_channel_info {
         enum hwmon_sensor_types type;
-       const u32 *config;
+       union {
+               const u32 *config;
+               const u64 *config64;
+       }
  };

  #define HWMON_CHANNEL_INFO(stype, ...)         \
@@ -444,12 +447,21 @@ struct hwmon_channel_info {
                 }                               \
         })

+#define HWMON_CHANNEL_INFO64(stype, ...)               \
+       (&(const struct hwmon_channel_info) {   \
+               .type = hwmon_##stype,          \
+               .config64 = (const u64 []) {    \
+                       __VA_ARGS__, 0          \
+               }                               \
+       })
+
  /**
   * struct hwmon_chip_info - Chip configuration
   * @ops:       Pointer to hwmon operations.
   * @info:      Null-terminated list of channel information.
   */
  struct hwmon_chip_info {
+       bool attribute_bit64; // use config64 pointer if it is true.
         const struct hwmon_ops *ops;
         const struct hwmon_channel_info * const *info;
  };
-->

