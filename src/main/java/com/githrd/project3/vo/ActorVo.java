package com.githrd.project3.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("actor")
public class ActorVo {

   int actor_idx;
   String actor_name;
   String actor_job;
   String actor_body;
   String actor_company;
   String actor_group;
   String actor_pic;

   List<PerformanceVo> performanceList;
}
