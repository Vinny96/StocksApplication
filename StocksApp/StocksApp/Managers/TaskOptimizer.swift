//
//  TaskOptimizer.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-29.
//

import Foundation

final class TaskOptimizer
{
    // properties
    static let shared = TaskOptimizer()
    fileprivate var taskQueue = [URLSessionDataTask]()
    
    
    // functionality
    func appendToQueue(taskToAppend : URLSessionDataTask)
    {
        if(taskQueue.isEmpty  == true)
        {
            taskToAppend.resume()
            taskQueue.append(taskToAppend)
        }
        else
        {
            // so here we are guaranteed to have 1 task in the taskQueue
            taskToAppend.resume()
            let task = taskQueue[0]
            task.cancel()
            print("task was cancelled")
            print("new task replaced the old task")
            taskQueue[0] = taskToAppend
            print(taskQueue)
            print("------------------------")
        }
    }
    
}
