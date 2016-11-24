Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:35691 "EHLO
        mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938670AbcKXOpC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Nov 2016 09:45:02 -0500
Received: by mail-qk0-f173.google.com with SMTP id n204so51360160qke.2
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Nov 2016 06:44:50 -0800 (PST)
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com. [209.85.220.177])
        by smtp.gmail.com with ESMTPSA id s41sm18954051qtc.39.2016.11.24.06.44.49
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Nov 2016 06:44:49 -0800 (PST)
Received: by mail-qk0-f177.google.com with SMTP id n21so51326828qka.3
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Nov 2016 06:44:49 -0800 (PST)
MIME-Version: 1.0
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 24 Nov 2016 14:44:48 +0000
Message-ID: <CAJX_Q+0hCFZAg4F2pf0sJ9WZKcQfBSruGxz4jLnX5SzLJvATqA@mail.gmail.com>
Subject: Configure Hardware before read sensor
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

My hardware needs to be configured before I can read the temperature sensor.
Like, my hardware can make 0-1023 samples per measure, more samples
more accurate, but takes longer times.
Where I can put a sysfs atribute to configure my hardware ? There is
no  temp[1-*]_configure or chip_configure.

Thanks

Lucas Tanure
