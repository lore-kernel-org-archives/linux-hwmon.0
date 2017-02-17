Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:42502 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S934088AbdBQQHI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Feb 2017 11:07:08 -0500
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1HG3nOa013190
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Feb 2017 10:07:06 -0600
Received: from mail2.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 28hywqh71y-1
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Feb 2017 10:07:06 -0600
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
        by mail2.cirrus.com (Postfix) with ESMTP id 6A55E6121ACD
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Feb 2017 10:07:06 -0600 (CST)
To: <linux-hwmon@vger.kernel.org>
CC: <patches@opensource.cirrus.com>
From: Lucas Tanure <tanureal@opensource.wolfsonmicro.com>
Subject: How to add nano precision measurement to hwmon
Message-ID: <32c30882-2466-a992-158b-870cc8af5b40@opensource.cirrus.com>
Date: Fri, 17 Feb 2017 16:07:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

We have here in our company an internal hardware platform for our linux 
development that can measure current in a few circuits with nanoamps 
precision.
The measured values are exposed by a 32bit register that must read as a 
32bit float.

If we follow the hwmon sysfs interface we loss precision converting to 
milliamps, where the final value exposed is zero.

Example :
Measure 291nA becomes 0mA under sysfs curr1_input

The best solution for me would be a file in sysfs that I could just 
expose the float from my register (like curr1_input_float), this 
solution has two benefits for me:

- I wouldn't need to convert my internal float to int
- This would give the best precision that I can have from my hardware

The value could be exposed as a 32bit hex string, like 0x349c3abc.

So, how should I proceed with this ?

Thanks

Lucas Tanure
